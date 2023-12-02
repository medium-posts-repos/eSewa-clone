// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NetworkPackage",
            targets: ["NetworkPackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0"),
        .package(path: "../DomainPackage")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NetworkPackage",
            dependencies: [
                .product(name: "DomainPackage", package: "DomainPackage"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "Alamofire", package: "Alamofire")
            ]),
        .testTarget(
            name: "NetworkPackageTests",
            dependencies: ["NetworkPackage"]),
    ]
)
