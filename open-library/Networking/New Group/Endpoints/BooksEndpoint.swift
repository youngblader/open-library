//
//  CategoriesEndpoint.swift
//  delivery-food-app
//
//  Created by Eugene on 13.04.23.
//

import Foundation

enum BooksEndpoint {
    case getBooks(key: String)
}

extension BooksEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getBooks:
            return "/svc/books/v3/lists/current/hardcover-fiction.json"
        }
    }
    
    var method: NetworkMethod {
        switch self {
        case .getBooks:
            return .get
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getBooks(let key):
            return [URLQueryItem(name: "api-key", value: key)]
        }
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
    
    var body: [String: String]? {
        switch self {
        case .getBooks:
            return nil
        }
    }
}
