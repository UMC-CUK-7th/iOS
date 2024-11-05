//
//  SearchModel.swift
//  iKREAM
//
//  Created by 김윤진 on 11/5/24.
//

import Foundation
import UIKit

struct SearchModel {
    let searchImage: UIImage
    /*let searchImage2: UIImage
    let searchImage3: UIImage
    let serchImage4: UIImage
    let searchImage5: UIImage
    let searchImage6: UIImage
    let searchImage7: UIImage*/
}

extension SearchModel {
    static func dummy() -> [SearchModel] {
        return [
            SearchModel(searchImage: .blue),
            SearchModel(searchImage: .purple),
            SearchModel(searchImage: .green),
            SearchModel(searchImage: .pink),
            SearchModel(searchImage: .red),
            SearchModel(searchImage: .brown),
            SearchModel(searchImage: .brown)
        ]
    }
}

