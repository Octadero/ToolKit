// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ToolKit",
    products: [ .library(name: "ToolKit", targets: ["ToolKit"]) ],
    dependencies: [],
    targets: [
        .target(name: "ToolKit", dependencies: []),
        .testTarget(name: "ToolKitTests", dependencies: ["ToolKit"]),
    ]
)
