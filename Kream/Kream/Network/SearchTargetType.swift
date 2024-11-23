//
//  SearchTargetType.swift
//  KREAM
//
//  Created by 류한비 on 11/20/24.
//

import Foundation
import Moya

enum SearchTargetType {
    case getAllSearchData(text: String)
}

extension SearchTargetType: TargetType{
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        return baseURL
    }
    
    var path: String {
        switch self{
        case.getAllSearchData:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getAllSearchData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllSearchData(let text):
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
        return ["Content-Type" : "application/json"]
    }
}
