//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageDetails

public class LocalStorageSDKMain {
    
    private var dataProvider: StorageProviderStrategy
    
    public init(dataProvider: StorageProviderStrategy) {
        self.dataProvider = dataProvider
    }
    
    public func insert<T>(_ object: T) throws -> T? {
        return try dataProvider.insert(object)
    }
    
    public func delete<T>(_ object: T) throws {
        return try dataProvider.delete(object)
    }
    
    public func update<T>(_ object: T) throws -> T {
        return try dataProvider.update(object)
    }

    public func fetch<T>() throws -> [T] {
        return try dataProvider.fetch()
    }

    public func fetchById<T>(_ id: String) throws -> T? {
        return try dataProvider.fetchById(id)
    }

    public func findByColumn<T, DataType>(column: String, value: DataType) throws -> [T] {
        return try dataProvider.findByColumn(column: column, value: value)
    }
}
