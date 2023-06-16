//
//  LibraryService.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import Foundation

let KEY: String = "RcANFiY9pE9b2OZaqPCsxGbauGeWFAF8"

final class LibraryService: API {
    func fetchBooks() async throws -> BookResponse {
        return try await request(endpoint: LibraryEndpoint.getBooks(key: KEY), responseModel: BookResponse.self)
    }
}
