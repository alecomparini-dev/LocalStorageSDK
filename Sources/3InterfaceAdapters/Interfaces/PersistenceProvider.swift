//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

public protocol PersistenceProvider {
    func insert<T>(_ object: T) throws -> T?
    func delete<T>(_ object: T) throws
    func update<T>(_ object: T) throws -> T
    func fetch<T>() throws -> [T]
    func fetchById<T>(_ id: String) throws -> T?
    func findByColumn<T, DataType>(column: String, value: DataType) async throws -> [T]
}

public protocol PersistenceJSONProvider {
    func insert<T>(key: String, _ value: T) throws -> T?
    func delete(key: String) throws
    func update<T>(key: String, _ value: T) throws -> T
}


