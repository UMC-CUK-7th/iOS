//
//  DroppedModel.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import Foundation
import UIKit

//5주차
struct DroppedModel {
    let droppedImage: UIImage
    let droppedImage2: UIImage
    let droppedtrade: String
    let droppedName: String
    let droppedDetail: String
    let droppedPrice: String
    let droppedbuy: String
}

extension DroppedModel {
    static func dummy() -> [DroppedModel] {
        return [
            DroppedModel(droppedImage: .MLB, droppedImage2: .unsaved, droppedtrade: "거래 12.8만", droppedName: "MLB", droppedDetail: "청키라이너 뉴욕양키스", droppedPrice: "139,000원", droppedbuy: "즉시 구매가"),
            DroppedModel(droppedImage: .jordan, droppedImage2: .saved, droppedtrade: "거래 15.6만", droppedName: "jordan", droppedDetail: "Jordan 1 Retro High OG Yellow Ochre", droppedPrice: "228,000원", droppedbuy: "즉시 구매가"),
            DroppedModel(droppedImage: .want, droppedImage2: .saved, droppedtrade: "거래 8만", droppedName: "OY", droppedDetail: "오와이 커브드 지퍼 라이트웨이트 퍼퍼 자켓 블랙", droppedPrice: "290,000원", droppedbuy: "즉시 구매가"),
        ]
    }
}
