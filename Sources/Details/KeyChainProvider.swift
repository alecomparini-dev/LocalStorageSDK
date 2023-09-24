//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import Security

import LocalStorageInterfaces

public class KeyChainProvider: StorageProviderStrategy {
    
    private let appName: String
    private let forKey: String
    
    public init(appName: String, forKey: String) {
        self.appName = appName
        self.forKey = forKey
    }
    
    
    public override func insert<T>(_ value: T) throws -> T? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: forKey,
            kSecValueData as String: Data((value as! String).utf8)
        ]
        
        let deleteQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: forKey
        ]
        
        let statusDelete = SecItemDelete(deleteQuery as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        //TODO: - CREATE ERROR
        guard status == errSecSuccess else {
            return nil
        }
        
        return value
    }
    
    public override func fetch<T>() throws -> [T] {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitAll
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            if let items = result as? [[String: Any]] {
                return items.map { item in
                    if let account = item[kSecAttrAccount as String] as? String,
                       let valueData = item[kSecValueData as String] as? Data,
                       let value = String(data: valueData, encoding: .utf8) {
                        return [account : value] as! T
                    }
                    return [:] as! T
                }
            }
        }
        
        return []
    }
    
    
    public override func fetchById<T>(_ id: String) throws -> T? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: id,
            kSecReturnData as String: kCFBooleanTrue as Any,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let valueData = result as? Data else {
            return nil
        }
            
        return String(data: valueData, encoding: .utf8) as? T
        
    }
    
    
    
}

