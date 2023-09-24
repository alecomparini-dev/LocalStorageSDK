//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageDetails

public class LocalStorageSDKMain {
    
    private var dataProvider: StorageProviderStrategy
    
    public init(dataProvider: StorageProviderStrategy) {
        self.dataProvider = dataProvider
    }
    
    public func insert<T>(_ object: T) throws -> T {
        return try dataProvider.insert(object)
    }
    
//    public func fetch() throws -> [T] {
//        return try dataProvider.fetch()
//    }
    
}
