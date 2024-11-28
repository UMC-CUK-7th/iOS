//
//  DetailPageModel.swift
//  KREAM
//
//  Created by 류한비 on 11/5/24.
//

import Foundation
import UIKit

struct DetailPageModel{
    let image: UIImage
}

extension DetailPageModel{
    static func dummy() -> [DetailPageModel] {
        return [
            DetailPageModel(image: UIImage(named: "Stussy")!),
            DetailPageModel(image: UIImage(named: "Stussy2")!),
            DetailPageModel(image: UIImage(named: "Stussy3")!),
            DetailPageModel(image: UIImage(named: "Stussy4")!),
            DetailPageModel(image: UIImage(named: "Stussy5")!),
            DetailPageModel(image: UIImage(named: "Stussy6")!),
            DetailPageModel(image: UIImage(named: "Stussy7")!),
            DetailPageModel(image: UIImage(named: "Stussy8")!),
            DetailPageModel(image: UIImage(named: "Stussy9")!)
        ]
    }
}
