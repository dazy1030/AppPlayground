// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "HomeFeature", targets: ["HomeFeature"]),
        .library(name: "MyPageFeature", targets: ["MyPageFeature"]),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                .target(name: "HomeFeature"),
                .target(name: "MyPageFeature"),
            ]
        ),
        .target(name: "HomeFeature"),
        .target(name: "MyPageFeature"),
    ]
)
