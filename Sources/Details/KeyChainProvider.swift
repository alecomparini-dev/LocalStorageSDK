//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import Security

import LocalStorageInterfaces

public class KeyChainProvider: ProviderStrategy {
    
    private let appName: String
    private let forKey: String
    
    public init(appName: String, forKey: String) {
        self.appName = appName
        self.forKey = forKey
    }
    
    
    public override func insert<T>(_ value: T) throws -> T {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: appName,
            kSecAttrAccount as String: forKey,
            kSecValueData as String: value
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        //TODO: - CREATE ERROR
        guard status == errSecSuccess else {
            return value
        }
        
        return value
    }
    
    public func fetch<T>() throws -> [T] {
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
    
}

