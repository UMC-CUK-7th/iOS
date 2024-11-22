import UIKit


struct RecommendLabelModel {
    let title : String
    
    
}
extension RecommendLabelModel{
    static func dummy() -> [RecommendLabelModel] {
        return[
            RecommendLabelModel(title: "채원 슈프림 후리스"),
            RecommendLabelModel(title: "나이키 V2K런"),
            RecommendLabelModel(title: "뉴발란드996"),
            RecommendLabelModel(title: "신상 나이키 콜라보"),
            RecommendLabelModel(title: "허그 FW 패딩"),
            RecommendLabelModel(title: "벨루어 눕시")
        ]
    }
}
