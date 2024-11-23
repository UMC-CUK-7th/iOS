//
//  SearchTargetType.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import Foundation
import Moya

enum SearchTargetType {
    case getSearch(text: String)
}

extension SearchTargetType : TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")! // ! = nil
    }
    
    var path: String {
        switch self {
        case .getSearch:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearch:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearch(let text):
            let parameters: [String: Any] = [
                "q": text
            ]
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getSearch:
            return ["Content-type": "application/json"]
        }
    }
    
}
