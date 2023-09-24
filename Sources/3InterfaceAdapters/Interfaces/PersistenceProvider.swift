//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

public protocol PersistenceProvider {
    func insert<T>(_ entity: T) throws -> T?
    func delete<T>(_ entity: T) throws
    func update<T>(_ entity: T) throws -> T
    func fetch<T>() throws -> [T]
    func fetchByID<T>(_ id: String) throws -> T?
    func findByColumn<T, DataType>(column: String, value: DataType) async throws -> [T]
}


