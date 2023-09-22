//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

public protocol PersistenceProvider {
    associatedtype T
    func insert(_ object: T) throws -> T
    func fetch() throws -> [T]
}


