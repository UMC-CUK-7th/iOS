//
//  ProductModel.swift
//  KREAM
//
//  Created by 류한비 on 11/2/24.
//

import Foundation
import UIKit

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
