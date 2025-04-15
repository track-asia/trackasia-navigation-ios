// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "trackasia-navigation-ios",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "MapboxNavigation",
            targets: [
                "MapboxNavigation"
            ]
        ),
        .library(
            name: "MapboxCoreNavigation",
            targets: [
                "MapboxCoreNavigation"
            ]
        ),
        .library(
            name: "MapboxCoreNavigationObjC",
            targets: [
                "MapboxCoreNavigationObjC"
            ]
        ),
        .library(
            name: "MapboxNavigationObjC",
            targets: [
                "MapboxNavigationObjC"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/flitsmeister/mapbox-directions-swift", exact: "0.23.3"),
        .package(url: "https://github.com/mapbox/turf-swift.git", from: "2.8.0"),
        .package(url: "https://github.com/ceeK/Solar.git", exact: "3.0.1"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.53.6"),
        .package(url: "https://github.com/track-asia/trackasia-gl-native-distribution.git", from: "2.0.3")
    ],
    targets: [
        .target(
            name: "MapboxCoreNavigation",
            dependencies: [
                "MapboxCoreNavigationObjC",
                .product(name: "Turf", package: "turf-swift"),
                .product(name: "MapboxDirections", package: "mapbox-directions-swift")
            ],
            path: "MapboxCoreNavigation",
            resources: [.process("Resources")]
        ),
        .target(
            name: "MapboxCoreNavigationObjC",
            dependencies: [],
            path: "MapboxCoreNavigationObjC",
            exclude: [],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
        .target(
            name: "MapboxNavigation",
            dependencies: [
                "MapboxCoreNavigation",
                "MapboxNavigationObjC",
                .product(name: "Solar", package: "Solar")
            ],
            path: "MapboxNavigation",
            resources: [
                .copy("Resources/Assets.xcassets")
            ]
        ),
        .target(
            name: "MapboxNavigationObjC",
            dependencies: [
                "MapboxCoreNavigationObjC",
                .product(name: "TrackAsia", package: "trackasia-gl-native-distribution")
            ],
            path: "MapboxNavigationObjC",
            exclude: [],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath(".")
            ]
        ),
        .testTarget(
            name: "MapboxNavigationTests",
            dependencies: [
                "MapboxNavigation",
                "MapboxCoreNavigation",
                "Solar"
            ],
            path: "MapboxNavigationTests",
            resources: [
                .process("Assets.xcassets"),
                .copy("Fixtures/EmptyStyle.json"),
                .copy("Fixtures/route.json"),
                .copy("Fixtures/route-for-lane-testing.json"),
                .copy("Fixtures/route-with-banner-instructions.json"),
                .copy("Fixtures/route-with-instructions.json"),
                .copy("Fixtures/route-with-lanes.json")
            ]
        ),
        .testTarget(
            name: "MapboxCoreNavigationTests",
            dependencies: [
                "MapboxNavigation",
                "MapboxCoreNavigation"
            ],
            path: "MapboxCoreNavigationTests",
            resources: [
                .copy("Resources")
            ]
        )
    ]
)
