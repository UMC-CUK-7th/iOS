//
//  SavedModel.swift
//  KREAM
//
//  Created by 서재민 on 10/21/24.
//

import UIKit

struct SavedModel {
    let name: String
    let image: String
    let description: String
    let price: String
}

class DummySavedModel {
    static let Productdata: [SavedModel] = [
        SavedModel(name:"손오공", image:"Monkey.png",description:"설명중..............dkdkddddddddddddddddddd",price:"가치측정불가"),
        SavedModel(name:"절대반지", image:"Ring.png",description:" 설명란",price:"1000,000,000원"),
        SavedModel(name:"Nike", image:"Nike.png",description:" aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",price:"140,000원"),
        SavedModel(name:"아디다스", image:"Shoe.png",description:" 설명란",price:"100,000원"),
        SavedModel(name:"뉴발란스", image:"Shoe.png",description:" 설명란",price:"1000원"),
        SavedModel(name:"퓨마", image:"Shoe.png",description:" 설명란",price:"100원"),
        SavedModel(name:"프로스펙스", image:"Shoe.png",description:" 설명란",price:"1원"),
        SavedModel(name:"문해기", image:"profile.png",description:" 설명란",price:"1000,000,000원"),
        SavedModel(name:"과제", image:"Ring.png",description:" 설명란",price:"1000,000,000원"),
        SavedModel(name:"짜증난다", image:"Ring.png",description:" 설명란",price:"1000,000,000원")
        ]
}
