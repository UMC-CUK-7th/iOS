//
//  LoginModel.swift
//  iKREAM
//
//  Created by 김윤진 on 9/26/24.
//

import Foundation
import UIKit

struct LoginModel {
    // id와 password를 저장하는 변수 선언
    var id: String
    var pwd: String
}

//3주차
struct SavedModel {
    let savedImage: String
    let savedName: String
    let savedDescription: String
    let savedKeep : String
    let savedPrice : String
}

//4주차
struct HomeModel {
    let homemodelImage: UIImage
    let homemodelName: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(savedImage: "son.png", savedName: "손오공이 잃어버린 머리띠 반쪽", savedDescription: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", savedKeep: "keep.png", savedPrice: "942,192,000원"),
        SavedModel(savedImage: "goldring.png", savedName: "금색 반지", savedDescription: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", savedKeep: "keep.png", savedPrice: "12,000원"),
        SavedModel(savedImage: "whiteshoes.png", savedName: "하얀 신발", savedDescription: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지...", savedKeep: "keep.png", savedPrice: "90,000원"),
        SavedModel(savedImage: "ring.png", savedName: "에베레스트 다이아 반지", savedDescription: "에베레스트 다이아 반지", savedKeep: "keep.png", savedPrice: "1,292,999,000원"),
        SavedModel(savedImage: "adidas.png", savedName: "아디다스다 신발", savedDescription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", savedKeep: "keep.png", savedPrice: "120,000원"),
        SavedModel(savedImage: "pajam.png", savedName: "황제 잠옷", savedDescription: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", savedKeep: "keep.png", savedPrice: "120,000,000원"),
        SavedModel(savedImage: "guitar.png", savedName: "고장난 기타", savedDescription: "블라블라블라블라 블라블라블라블라블라", savedKeep: "keep.png", savedPrice: "120,000원"),
        SavedModel(savedImage: "timber.png", savedName: "팀버랜드", savedDescription: "진짜사고싶은데너무비싸", savedKeep: "keep.png", savedPrice: "240,000원"),
        SavedModel(savedImage: "padding.png", savedName: "검정 패딩", savedDescription: "추울 땐 패딩이지", savedKeep: "keep.png", savedPrice: "210,000원"),
        SavedModel(savedImage: "force.png", savedName: "된장 포스", savedDescription: "된장포스를 아느냐", savedKeep: "keep.png", savedPrice: "140,000원"),
    ]
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
