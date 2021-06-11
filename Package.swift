// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSFeedKit",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        .library(name: "CSFeedKit", targets: ["CSFeedKit"]),
    ],
    targets: [
        .target(
            name: "CSFeedKit",
            path: "CSFeedKit",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("RSS")
            ]
        ),

        .testTarget(name: "CSFeedKitTests",
                    dependencies: ["CSFeedKit"],
                    path: "CSFeedKitTests"),
    ]
)
