//
//  WinterModel.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import Foundation
import UIKit

//4주차
struct WinterModel {
    let wintermodelImage: UIImage
    let wintermodelName: String
}



extension WinterModel {
    static func dummy() -> [WinterModel] {
        return [
            WinterModel(wintermodelImage: .karina, wintermodelName: "@katarinabluu"),
            WinterModel(wintermodelImage: .winter, wintermodelName: "@imwinter"),
            WinterModel(wintermodelImage: .thousand, wintermodelName: "@thousand_wooo")
        ]
    }
}
