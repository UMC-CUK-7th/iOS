//
//  ChallengeModel.swift
//  KREAM
//
//  Created by 류한비 on 11/2/24.
//

import Foundation
import UIKit

struct ChallengeModel {
    let image: UIImage
    let name: String
}

extension ChallengeModel {
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: UIImage(named: "instImage1")!, name: "@meenoie"),
            ChallengeModel(image: UIImage(named: "instImage2")!, name: "@jxxvvxxk"),
            ChallengeModel(image: UIImage(named: "instImage3")!, name: "@katarinabluu"),
            ChallengeModel(image: UIImage(named: "instImage4")!, name: "@imwinter"),
            ChallengeModel(image: UIImage(named: "instImage5")!, name: "@thousand_wooo")
        ]
    }
}
