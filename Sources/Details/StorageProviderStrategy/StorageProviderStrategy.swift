
//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import LocalStorageInterfaces

public class StorageProviderStrategy: PersistenceProvider {
    public init() {}
    
    public func insert<T>(forKey: String, _ value: T) throws -> T? {
        fatalError("The method insert, needs to be implemented by the subclasses ")
    }
    
    public func delete(_ forKey: String) throws {
        fatalError("The method delete, needs to be implemented by the subclasses ")
    }
    
    public func update<T>(forKey: String, _ value: T) throws -> T {
        fatalError("The method update, needs to be implemented by the subclasses ")
    }

    public func fetch<T>() throws -> [T] {
        fatalError("The method fetch, needs to be implemented by the subclasses ")
    }

    public func fetchById<T>(_ key: String) throws -> T? {
        fatalError("The method fetchByID, needs to be implemented by the subclasses ")
    }

    public func findByColumn<T, DataType>(column: String, value: DataType) throws -> [T] {
        fatalError("The method findByColumn, needs to be implemented by the subclasses ")
    }
    
    
}
