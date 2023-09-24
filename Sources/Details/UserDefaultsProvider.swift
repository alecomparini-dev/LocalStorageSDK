//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageInterfaces

public class UserDefaultsProvider: StorageProviderStrategy {
    
    private let userDefaults: UserDefaults
    private let forKey: String
    
    public init(forKey: String, userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.forKey = forKey
    }
    
    public override func insert<T>(_ codable: T) throws -> T {
        userDefaults.set(codable, forKey: forKey)
        return codable
    }
    
    public override func fetch<T>() throws -> [T] {
        return userDefaults.value(forKey: forKey) as! [T]
    }
    
}
