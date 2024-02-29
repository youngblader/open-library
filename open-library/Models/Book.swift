//
//  Book.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import Foundation

struct Book: Codable {
    var rank: Int
    var rankLastWeek: Int
    var weeksOnList: Int
    var asterisk: Int
    var dagger: Int
    var primaryIsbnTen: String?
    var primaryIsbnThirteen: String?
    var publisher: String
    var description: String
    var price: String
    var title: String
    var author: String
    var contributor: String
    var contributorNote: String
    var bookImage: String
    var bookImageWidth: Int
    var bookImageHeight: Int
    var amazonProductUrl: String
    var ageGroup: String
    var bookReviewLink: String
    var firstChapterLink: String
    var sundayReviewLink: String
    var articleChapterLink: String
    var isbns: [Isbns]
    var buyLinks: [BuyLink]
    var bookUri: String
}

struct BuyLink: Codable {
    var name: String
    var url: String
}

struct Isbns: Codable {
    let isbnTen: String?
    let isbnThirteen: String?
}
