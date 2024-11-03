//
//  HomeModel.swift
//  KREAM
//
//  Created by 류한비 on 10/22/24.
//

import Foundation
import UIKit

struct HomeModel {
    let image: UIImage
    let name: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .homeCell1, name: "크림 드로우"),
            HomeModel(image: .homeCell2, name: "실시간 차트"),
            HomeModel(image: .homeCell3, name: "남성 추천"),
            HomeModel(image: .homeCell4, name: "여성 추천"),
            HomeModel(image: .homeCell5, name: "색다른 추천"),
            HomeModel(image: .homeCell6, name: "정가 아래"),
            HomeModel(image: .homeCell7, name: "윤세 24AW"),
            HomeModel(image: .homeCell8, name: "올해의 베스트"),
            HomeModel(image: .homeCell9, name: "10월 베네핏"),
            HomeModel(image: .homeCell10, name: "아크네 선물"),
        ]
    }
}
