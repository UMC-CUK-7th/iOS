//
//  HomeModel.swift
//  KREAM
//
//  Created by 류한비 on 10/22/24.
//

import Foundation
import UIKit

//MARK: - HomeModel
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

//MARK: - ProductModel
struct ProductModel {
    let image: UIImage
    let name: String
    let info: String
    let price: String
    let label: String
}

extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(image: UIImage(named: "IMG_3023")!, name: "Adidas", info: "Adidas Samba OG Dark Brown Clay Brown", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: UIImage(named: "IMG_3024")!, name: "Salomon", info: "Salomon x Sandy Liang RX Marie Jeanne Black", price: "250,000원", label: "거래 9.6만"),
            ProductModel(image: UIImage(named: "MLB")!, name: "MLB", info: "청키라이너 뉴욕양키스", price: "139,000원", label: "거래 12.8만"),
            ProductModel(image: UIImage(named: "Jordan")!, name: "Jordan", info: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", label: "거래 15.6만")
        ]
    }
}

//MARK: - ChallengeModel
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
