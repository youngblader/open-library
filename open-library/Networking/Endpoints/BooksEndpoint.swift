//
//  CategoriesEndpoint.swift
//  delivery-food-app
//
//  Created by Eugene on 13.04.23.
//

import Foundation
import Moya

enum BooksEndpoint {
    case getBooks
}

extension BooksEndpoint: TargetType {
    var baseURL: URL { URL(string: "https://api.nytimes.com")! }
    
    var path: String {
        switch self {
        case .getBooks:
            return "/svc/books/v3/lists/current/hardcover-fiction.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBooks:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        if let key = ProcessInfo.processInfo.environment["API_KEY"] {
            switch self {
            case .getBooks:
                return ["api-key": key]
            }
        }
        
        return [:]
    }
    
    var headers: [String: String]? {
        let accessToken = ""
        switch self {
        case .getBooks:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getBooks:
            return .requestCompositeData(bodyData: sampleData, urlParameters: parameters)
        }
    }
}
