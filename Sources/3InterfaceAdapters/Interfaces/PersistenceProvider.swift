//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

public protocol PersistenceProvider {
    func insert<T>(forKey: String, _ value: T) throws -> T?
    func delete(_ object: String) throws
    func update<T>(_ object: T) throws -> T
    func fetch<T>() throws -> [T]
    func fetchById<T>(_ forKey: String) throws -> T?
    func findByColumn<T, DataType>(column: String, value: DataType) async throws -> [T]
}


