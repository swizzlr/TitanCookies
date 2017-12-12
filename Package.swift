// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "TitanCookies",
    products: [
        .library(name: "TitanCookies", targets: ["TitanCookies"])
    ],
    dependencies: [
      .package(url: "https://github.com/bermudadigitalstudio/Titan.git", from: "0.8.0")
    ],
    targets: [
        .target(name: "TitanCookies", dependencies: ["TitanCore"])
    ]
)
