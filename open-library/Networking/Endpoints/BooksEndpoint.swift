//
//  BooksEndpoint.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
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
        switch self {
        case .getBooks:
            if let key = ProcessInfo.processInfo.environment["API_KEY"] {
                return ["api-key": key]
            }
            
            return [:]
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getBooks:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
}
