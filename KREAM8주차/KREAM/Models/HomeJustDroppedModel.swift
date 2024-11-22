//
//  HomeJustDropped.swift
//  KREAM
//
//  Created by 서재민 on 10/31/24.
//

import UIKit
struct HomeJustDroppedModel{
    let image: UIImage
    let title: String
    let subtitle: String
    let price: String
    
}

extension HomeJustDroppedModel{
    static func HomeJustDroppedDummy() -> [HomeJustDroppedModel] {
        return [
            HomeJustDroppedModel(image: .justDropped,title: "MLB",subtitle: "청키라이너 뉴욕양키스",price: "139,000원"),
            HomeJustDroppedModel(image: .justDropped2,title: "Jordan",subtitle: "Jordan 1 Retro High OG Yellow Ochre",price: "139,000원"),
            HomeJustDroppedModel(image: .justDropped3,title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원")
            
        ]
            }
    }
        
