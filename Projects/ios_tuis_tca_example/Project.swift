import ProjectDescription

let project = Project(
    name: "ios_tuis_tca_example",
    targets: [
        .target(
            name: "ios_tuis_tca_example",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.ios-tuis-tca-example",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "TuistUI", path: "../TuistUI")
            ]
        ),
        .target(
            name: "ios_tuis_tca_exampleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ios-tuis-tca-exampleTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "ios_tuis_tca_example")]
        ),
    ]
)
