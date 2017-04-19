// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "TitanCookies",
    dependencies: [
      .Package(url: "https://github.com/BermudaDigitalStudio/TitanCore.git", majorVersion: 0, minor: 3)
    ]
)
