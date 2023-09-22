
//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import LocalStorageInterfaces

public class ProviderStrategy<T>: PersistenceProvider {
    public typealias T = T
    
    public init() {}
    
    public func insert(_ object: T) throws -> T {
        fatalError("The method insert, needs to be implemented by the subclasses ")
    }
    
    public func fetch() throws -> [T] {
        fatalError("The method fetch, needs to be implemented by the subclasses ")
    }
    
}
