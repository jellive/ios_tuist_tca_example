// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "ios_tuis_tca_example",
    dependencies: [
        // Add your own dependencies here:
         .package(url: "https://github.com/Alamofire/Alamofire", from: "5.10.0"),
         .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.17.0")
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
    ]
)
