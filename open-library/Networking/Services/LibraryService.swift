//
//  LibraryService.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import Foundation

let KEY: String = "RcANFiY9pE9b2OZaqPCsxGbauGeWFAF8"

protocol LibraryServiceProtocol {
    func fetchBooks() async throws -> BookResponse
}

final class LibraryService: API, LibraryServiceProtocol {
    func fetchBooks() async throws -> BookResponse {
        return try await request(endpoint: LibraryEndpoint.getBooks(key: KEY), responseModel: BookResponse.self)
    }
}
