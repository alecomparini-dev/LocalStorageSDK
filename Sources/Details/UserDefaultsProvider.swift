//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageInterfaces

public class UserDefaultsProvider: StorageProviderStrategy {
    
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    public override func insert<T>(key: String, _ value: T) throws -> T {
        userDefaults.set(value, forKey: key)
        return value
    }
    
    public override func fetchById<T>(_ forKey: String) throws -> T?  {
        if let result = userDefaults.value(forKey: forKey) as? T {
            return result
        }
        return nil
    }
    
}
