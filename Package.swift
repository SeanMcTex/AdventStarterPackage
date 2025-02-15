// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// if a specific day needs additional dependencies, add them here
let dayDependencies: [Int: [Target.Dependency]] = [:]

let dayTargets: [Target] = (1...25).map {
  .target(
    name: "Day\($0)",
    dependencies: [
      .product(name: "Algorithms", package: "swift-algorithms")
    ] + dayDependencies[$0, default: []])
}

let executableTarget = Target.executableTarget(
  name: "Main",
  dependencies: (1...25).map { .byName(name: "Day\($0)") }
)

let package = Package(
  name: "AdventOfCode",
  products: [
    .executable(name: "Main", targets: ["Main"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
  ],
  targets: [executableTarget] + dayTargets
)
