//
//  SavedModel.swift
//  KREAM
//
//  Created by 류한비 on 10/20/24.
//

import Foundation

struct SavedModel{
    let savedImage: String
    let savedTitle: String
    let savedPrice: String
    let savedInfo: String
}

final class dummySavedModel{
    static let saveDatas: [SavedModel] = [
        SavedModel(savedImage: "image 8.png", savedTitle: "Adidas", savedPrice : "153,000원", savedInfo : "(W) Adidas SL 72 OG Maroon Almost Yellow"),
        SavedModel(savedImage: "image 9.png", savedTitle: "Mischief", savedPrice : "288,000원", savedInfo : "Mischief Rhombus Lightweight Track Jacket Brown"),
        SavedModel(savedImage: "image 10.png", savedTitle: "Honsby", savedPrice : "239,000원", savedInfo : "Honsby Opera Maple"),
        SavedModel(savedImage: "image 1.png", savedTitle: "손오공이 잃어버린 머리띠 반쪽", savedPrice : "942,192,000원", savedInfo : "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!"),
        SavedModel(savedImage: "image 2.png", savedTitle: "골드반지", savedPrice : "12,000원", savedInfo : "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!"),
        SavedModel(savedImage: "image 3.png", savedTitle: "하얀신발", savedPrice : "90,000원", savedInfo : "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지..."),
        SavedModel(savedImage: "image 4.png", savedTitle: "에베레스트 다이아 반지", savedPrice : "1,292,999,000원", savedInfo : "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??"),
        SavedModel(savedImage: "image 5.png", savedTitle: "아디다스다 신발", savedPrice : "120,000원", savedInfo : "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~"),
        SavedModel(savedImage: "image 6.png", savedTitle: "황제 잠옷", savedPrice : "120,000,000원", savedInfo : "어느 나라의 황제가 입었다던 잠옷\n크리스마스 트리같이 보이는 디자인!"),
        SavedModel(savedImage: "image 7.png", savedTitle: "고장난 기타", savedPrice : "120,000원", savedInfo : "고장난 기타를 왜 파는 거야 신고해")
    ]
}
