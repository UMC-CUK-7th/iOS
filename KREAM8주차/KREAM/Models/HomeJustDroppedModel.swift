//
//  HomeJustDropped.swift
//  KREAM
//
//  Created by 서재민 on 10/31/24.
//
import Kingfisher
import UIKit
struct HomeJustDroppedModel{
    let imageURL: URL?
    let title: String
    let subtitle: String
    let price: String
    
}
class HomeJustDroppedImageUrls{
    var ImageURL: [String] = [ "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%B5%E1%84%8F%E1%85%A1%E1%84%8E%E1%85%B2.png?alt=media&token=68c2ffff-81a5-4db9-a67e-b776242cea02",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8C%E1%85%A1%E1%86%B7%E1%84%86%E1%85%A1%E1%86%AB%E1%84%87%E1%85%A9.png?alt=media&token=e040d3d4-dd5e-4d81-b5e8-55c44c4f1606",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A1%E1%86%BC%E1%84%92%E1%85%A2%E1%84%8A%E1%85%B5.png?alt=media&token=90aafed7-36d4-4da9-84f0-05285a8184d2",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8C%E1%85%B2%E1%84%87%E1%85%A6%E1%86%BA.png?alt=media&token=c3ed67c4-fc4b-4122-9c4c-e75e3c18b6b6",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%82%E1%85%A1%E1%84%8B%E1%85%A9%E1%86%BC.png?alt=media&token=8c14389d-10ad-4c5a-9562-2088316afab5",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%8B%E1%85%B5%E1%84%87%E1%85%B3%E1%84%8B%E1%85%B5.png?alt=media&token=bfd54682-7519-4ed9-a800-ca213b858a7f",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%91%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%85%E1%85%B5.png?alt=media&token=9f5dba67-0857-4d21-8ffb-d92db0d54566",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%81%E1%85%A9%E1%84%87%E1%85%AE%E1%84%80%E1%85%B5.png?alt=media&token=4c72eb7f-ab20-4184-8019-fe3033ee6fbe",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%88%E1%85%AE%E1%86%AF%E1%84%8E%E1%85%AE%E1%86%BC%E1%84%8B%E1%85%B5.png?alt=media&token=e9f65eea-70c6-486a-a647-876105edbf51",
                               
        "https://firebasestorage.googleapis.com/v0/b/honggun-blog.appspot.com/o/%E1%84%80%E1%85%A9%E1%84%85%E1%85%A1%E1%84%91%E1%85%A1%E1%84%83%E1%85%A5%E1%86%A8.png?alt=media&token=1bc8cf35-e38b-4726-b5ec-844b0851c035"
]
}
extension HomeJustDroppedModel{

    static func HomeJustDroppedDummy() -> [HomeJustDroppedModel] {
        
        return [
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[0]),title: "MLB",subtitle: "청키라이너 뉴욕양키스",price: "139,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[1]),title: "Jordan",subtitle: "Jordan 1 Retro High OG Yellow Ochre",price: "139,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[2]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[3]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[4]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[5]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[6]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[7]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[8]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            HomeJustDroppedModel(imageURL: URL(string: HomeJustDroppedImageUrls().ImageURL[9]),title: "Human Made",subtitle: "Human Made x Kaws Varsity Jacket #1 Black",price: "2,000,000원"),
            
        ]
            }
    }
        
