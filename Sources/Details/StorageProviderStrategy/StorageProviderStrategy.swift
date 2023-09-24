
//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import LocalStorageInterfaces

public class StorageProviderStrategy: PersistenceProvider {
    public init() {}
    
    public func insert<T>(_ object: T) throws -> T? {
        fatalError("The method insert, needs to be implemented by the subclasses ")
    }
    
    public func delete<T>(_ entity: T) throws {
        fatalError("The method delete, needs to be implemented by the subclasses ")
    }
    
    public func update<T>(_ entity: T) throws -> T {
        fatalError("The method update, needs to be implemented by the subclasses ")
    }

    public func fetch<T>() throws -> [T] {
        fatalError("The method fetch, needs to be implemented by the subclasses ")
    }

    public func fetchByID<T>(_ id: String) throws -> T? {
        fatalError("The method fetchByID, needs to be implemented by the subclasses ")
    }

    public func findByColumn<T, DataType>(column: String, value: DataType) async throws -> [T] {
        fatalError("The method findByColumn, needs to be implemented by the subclasses ")
    }
    
    
}
