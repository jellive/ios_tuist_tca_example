//
//  Project.swift
//  Config
//
//  Created by Jell PD on 9/6/24.
//

import ProjectDescription

let project = Project(
    name: "TuistUI",
    targets: [
        .target(name: "TuistUI", destinations: .iOS, product: .staticLibrary, bundleId: "io.tuist.TuistUI", sources: "Sources/**", dependencies: [])
    ]
)
