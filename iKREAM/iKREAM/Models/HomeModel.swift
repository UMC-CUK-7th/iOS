//
//  HomeModel.swift
//  iKREAM
//
//  Created by 김윤진 on 10/28/24.
//

import Foundation
import UIKit

//4주차
struct HomeModel {
    let homemodelImage: UIImage
    let homemodelName: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(homemodelImage: .draw, homemodelName: "크림 드로우"),
            HomeModel(homemodelImage: .chart, homemodelName: "실시간 차트"),
            HomeModel(homemodelImage: .mans, homemodelName: "남성 추천"),
            HomeModel(homemodelImage: .womans, homemodelName: "여성 추천"),
            HomeModel(homemodelImage: .special, homemodelName: "색다른 추천"),
            HomeModel(homemodelImage: .low, homemodelName: "정가 아래"),
            HomeModel(homemodelImage: .yunsea, homemodelName: "윤세24FW"),
            HomeModel(homemodelImage: .best, homemodelName: "올해의 베스트"),
            HomeModel(homemodelImage: .benefit, homemodelName: "10월 베네핏"),
            HomeModel(homemodelImage: .acene, homemodelName: "아크네 선물"),

        ]
        
    }

}
