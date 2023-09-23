
//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation
import LocalStorageInterfaces

public class ProviderStrategy {
    
    public init() {}
    
    public func insert<T>(_ object: T) throws -> T {
        fatalError("The method insert, needs to be implemented by the subclasses ")
    }
    
//    public func fetch() throws -> [T] {
//        fatalError("The method fetch, needs to be implemented by the subclasses ")
//    }
    
}
