// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "LocalStorageSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    
    products: [
        .library(name: "LocalStorageSDKMain", targets: ["LocalStorageSDKMain"]),
    ],
    
    
    targets: [
        
        
        
        
//  MARK: - TARGET INTERFACE ADAPTERS
        
        .target(
            name: "LocalStorageInterfaces",
            dependencies: [],
            path: "Sources/3InterfaceAdapters/Interfaces"
        ),
        
        
   
        
//  MARK: - TARGET INTERFACE ADAPTERS
        
        .target(
            name: "LocalStorageDetails",
            dependencies: [
                "LocalStorageInterfaces"
            ],
            path: "Sources/Details"
        ),
        
        
        
//  MARK: - TARGET MAIN
        .target(
            name: "LocalStorageSDKMain",
            dependencies: [
                "LocalStorageDetails",
            ],
            path: "Sources/Main"
        ),


//  MARK: - TESTS TARGETS AREA
        
        .testTarget(name: "LocalStorageSDKTests", dependencies: []),
    ]
)
