//
//  HomeModel.swift
//  KREAM
//
//  Created by 서재민 on 10/24/24.
//

import UIKit

struct HomeModel {
    let image: UIImage
    let title: String
}

extension HomeModel{
    static func dummy() -> [HomeModel] {
        return[
            HomeModel(image: .homeCollection1, title:"크림 드로우"),
            HomeModel(image: .homeCollection2, title:"실시간 차트"),
            HomeModel(image: .homeCollection3, title:"남성 추천"),
            HomeModel(image: .homeCollection4, title:"여성 추천"),
            HomeModel(image: .homeCollection5, title: "색다른 추천"),
            HomeModel(image: .homeCollection6, title: "정가 아래"),
            HomeModel(image: .homeCollection7, title: "윤세 24AW"),
            HomeModel(image: .homeCollection8, title: "올해의 베스트"),
            HomeModel(image: .homeCollection9, title: "10월 베네핏"),
            HomeModel(image: .homeCollection10, title: "아크네 선물")
            
            
        ]
    }
}
