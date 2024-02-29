//
//  BooksService.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import Foundation
import Moya

protocol BooksServiceProtocol {
    func fetchBooks(completion: @escaping (Result<BooksResponse, Error>) -> ())
}

final class BooksService: API, BooksServiceProtocol {
    func fetchBooks(completion: @escaping (Result<BooksResponse, Error>) -> ()) {
        request(target: .getBooks, completion: completion)
    }
}
