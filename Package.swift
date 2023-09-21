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
        .target(
            name: "LocalStorageSDKMain",
            dependencies: [],
            path: "Sources/Main"
        ),

        

//  MARK: - TESTS TARGETS AREA
        
        .testTarget(name: "LocalStorageSDKTests", dependencies: []),
    ]
)
