//
//  NetworkError.swift
//  delivery-food-app
//
//  Created by Eugene on 13.04.23.
//

import Foundation

enum NetworkError: Error {
    case urlInvalid
    case requestInvalid
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var message: String {
        switch self {
        case .urlInvalid:
            return "url invalid"
        case .requestInvalid:
            return "req invalid"
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
