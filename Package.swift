// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "BlurOverlayView",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "BlurOverlayView",
            targets: ["BlurOverlayView"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BlurOverlayView",
            dependencies: []
        ),
    ]
)
