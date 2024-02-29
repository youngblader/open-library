//
//  BooksResponse.swift
//  open-library
//
//  Created by Евгений Зорич on 29.02.24.
//

import Foundation

struct BooksResponse: Codable {
    let status: String
    let copyright: String
    let numResult: Int?
    let lastModified: String
    let results: BookResults
}

struct BookResults: Codable {
    let listName: String
    let listNameEncoded: String
    let bestsellersDate: String
    let publishedDate: String
    let publishedDateDescription: String
    let nextPublishedDate: String
    let previousPublishedDate: String
    let displayName: String
    let normalListEndsAt: Int
    let updated: String
    let books: [Book]
}
