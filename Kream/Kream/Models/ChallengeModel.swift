//
//  ChallengeModel.swift
//  KREAM
//
//  Created by 류한비 on 11/2/24.
//

import Foundation
import UIKit
import Kingfisher

struct ChallengeModel {
    let image: String
    let name: String
}

extension ChallengeModel {
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: "https://i.pinimg.com/736x/32/00/23/3200236dd98619d55c24bfd5a6baa574.jpg", name: "@meenoie"),
            ChallengeModel(image: "https://i.pinimg.com/474x/c0/78/17/c07817ebb9de18edaf92deeec7f1d2cf.jpg", name: "@jxxvvxxk"),
            ChallengeModel(image: "https://i.pinimg.com/474x/1b/93/bc/1b93bcb82fb079088a80a8ae1c60cd84.jpg", name: "@katarinabluu"),
            ChallengeModel(image: "https://i.pinimg.com/474x/aa/c0/20/aac0202d3c8979e2fea75aa2f04cb995.jpg", name: "@imwinter"),
            ChallengeModel(image: "https://i.pinimg.com/736x/46/4f/a2/464fa27fba0a1ef279b93258466cc605.jpg", name: "@youjunglan"),
            ChallengeModel(image: "https://i.pinimg.com/474x/eb/77/1f/eb771f524bf260a55e31b60b340cbe76.jpg", name: "@newjeans_official"),
            ChallengeModel(image: "https://i.pinimg.com/474x/b9/e1/d1/b9e1d1cd8a48f65a3846a52a34d03192.jpg", name: "@imnotningning"),
            ChallengeModel(image: "https://i.pinimg.com/474x/c9/9f/36/c99f36ccc95cec2ef75124db6f6ab897.jpg", name: "@newjeans_official"),
            ChallengeModel(image: "https://i.pinimg.com/474x/13/76/de/1376de82a9996524ff1bf2f9b1840712.jpg", name: "@byeonwooseok"),
            ChallengeModel(image: "https://i.pinimg.com/474x/ce/20/bc/ce20bca643e2c9fd5abc9dd7c009329b.jpg", name: "@yerin_the_genuine")
        ]
    }
}
