//
//  KreamTargetType.swift
//  KREAM
//
//  Created by 서재민 on 11/23/24.
//

import Foundation
import Moya

public enum KreamTargetType {
    case getSearch(text: String)
}


extension KreamTargetType: TargetType {
    public var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    public var path: String {
        switch self {
        case.getSearch:
            return "/products/search"
        }
        
        
    }
    
    public var method: Moya.Method {
      switch self {
      case .getSearch:
          return .get
        }
    }
    
    public var task: Moya.Task {
        switch self{
        case .getSearch(let text):
            let parameters: [String: Any] = ["text": text]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getSearch:
            return["content-type": "application/json"]
        }
    }
    
    
}
