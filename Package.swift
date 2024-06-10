// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QaraLearningEngine",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "QaraLearningEngine",
            targets: ["QaraLearningEngine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sorunokoe/QaraDesginSystem", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "QaraLearningEngine",
        dependencies: [
            .product(name: "QaraDesignSystem", package: "QaraDesginSystem")
                
        ]),
        .testTarget(
            name: "QaraLearningEngineTests",
            dependencies: ["QaraLearningEngine"]),
    ]
)
