// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AZDateBuilder",
    defaultLocalization: "en",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "AZDateBuilder",
            targets: ["AZDateBuilderSwift"]),
        .library(
            name: "AZDateBuilderObjC",
            targets: ["AZDateBuilderObjC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hamcrest/OCHamcrest", .upToNextMajor(from: "9.0.1"))
    ],
    targets: [
        .target(
            name: "AZDateBuilderSwift",
            dependencies: [],
            path: "Lib/AZDateBuilderSwift"
        ),
        .target(
            name: "AZDateBuilderObjC",
            dependencies: ["OCHamcrest"],
            path: "Lib/AZDateBuilderObjC"
        ),
        .testTarget(
            name: "LogicTests",
            dependencies: ["AZDateBuilderObjC"],
            path: "./LogicTests"
        ),
        .testTarget(
            name: "SwiftTests",
            dependencies: ["AZDateBuilderSwift"],
            path: "./SwiftTests"
        ),
    ]
)
