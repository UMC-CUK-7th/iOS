//
//  SearchModel.swift
//  KREAM
//
//  Created by 류한비 on 11/20/24.
//

import Foundation
import UIKit

struct SearchModel {
    let label: String
}

extension SearchModel {
    static func dummy() -> [SearchModel] {
        return [
            SearchModel(label: "채원 슈프림 후리스"),
            SearchModel(label: "나이키V2K런"),
            SearchModel(label: "뉴발란스996"),
            SearchModel(label: "신상 나이키 콜라보"),
            SearchModel(label: "허그 FW 패딩"),
            SearchModel(label: "벨루어 눕시")
        ]
    }
}
