//  Created by Alessandro Comparini on 22/09/23.
//

import Foundation

import LocalStorageDetails

public class LocalStorageSDKMain<T> {
    
    private var dataProvider: ProviderStrategy<T>
    
    public init(dataProvider: ProviderStrategy<T>) {
        self.dataProvider = dataProvider
    }
    
    public func insert(_ object: T) throws -> T {
        return try dataProvider.insert(object)
    }
    
    public func fetch() throws -> [T] {
        return try dataProvider.fetch()
    }
    
}
