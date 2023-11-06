//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageDetails

public class LocalStorageSDKMain {
    
    private var dataProvider: StorageProviderStrategy
    
    public init(dataProvider: StorageProviderStrategy) {
        self.dataProvider = dataProvider
    }
    
    public func insert<T>(forKey: String, _ value: T) throws -> T?  {
        return try dataProvider.insert(forKey: forKey, value)
    }
    
    public func delete(_ forKey: String) throws {
        return try dataProvider.delete(forKey)
    }
    
    public func update<T>(forKey: String, _ value: T) throws -> T {
        return try dataProvider.update(forKey: forKey, value )
    }

    public func fetch<T>() throws -> [T] {
        return try dataProvider.fetch()
    }

    public func fetchById<T>(_ key: String) throws -> T? {
        return try dataProvider.fetchById(key)
    }

    public func findByColumn<T, DataType>(column: String, value: DataType) throws -> [T] {
        return try dataProvider.findByColumn(column: column, value: value)
    }
}
