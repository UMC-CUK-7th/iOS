//
//  ChucheonModel.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import Foundation
import UIKit

struct ChucheonModel {
    let keyName: String
    let size: CGSize // 셀 크기 추가
}

extension ChucheonModel {
    static func dummy() -> [ChucheonModel] {
        return [
            ChucheonModel(keyName: "채원 슈프림 후리스", size: CGSize(width: 123, height: 32)),
            ChucheonModel(keyName: "신상 나이키 콜라보", size: CGSize(width: 123, height: 32)),
            ChucheonModel(keyName: "나이키V2K런", size: CGSize(width: 95, height: 32)),
            ChucheonModel(keyName: "허그 FW 패딩", size: CGSize(width: 95, height: 32)),
            ChucheonModel(keyName: "뉴발란스996", size: CGSize(width: 95, height: 32)),
            ChucheonModel(keyName: "벨루어 눕시", size: CGSize(width: 84, height: 32))
        ]
    }
}

