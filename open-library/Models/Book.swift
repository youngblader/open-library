//
//  Book.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import Foundation

struct BookResponse: Codable {
    let status: String
    let copyright: String
    let numResult: Int
    let lastModified: String
    let results: Results
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case numResult = "num_results"
        case lastModified = "last_modified"
        case results
    }
}
    
struct BuyLink: Codable {
    var name: String
    var url: String
}
        
struct Results: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case listNameEncoded = "list_name_encoded"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case publishedDateDescription = "published_date_description"
        case nextPublishedDate = "next_published_date"
        case previousPublishedDate = "previous_published_date"
        case displayName = "display_name"
        case normalListEndsAt = "normal_list_ends_at"
        case updated
        case books
    }
}

struct EditionBook {
    var books: [Book]
    var publishDate: String
}

struct Book: Codable {
    var rank: Int
    var rankLastWeek: Int
    var weeksOnList: Int
    var asterisk: Int
    var dagger: Int
    var primaryIsbnTen: String
    var primaryIsbnThirteen: String
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
    
    enum CodingKeys: String, CodingKey {
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case asterisk
        case dagger
        case primaryIsbnTen = "primary_isbn10"
        case primaryIsbnThirteen = "primary_isbn13"
        case publisher
        case description
        case price
        case title
        case author
        case contributor
        case contributorNote = "contributor_note"
        case bookImage = "book_image"
        case bookImageWidth = "book_image_width"
        case bookImageHeight = "book_image_height"
        case amazonProductUrl = "amazon_product_url"
        case ageGroup = "age_group"
        case bookReviewLink = "book_review_link"
        case firstChapterLink = "first_chapter_link"
        case sundayReviewLink = "sunday_review_link"
        case articleChapterLink = "article_chapter_link"
        case isbns
        case buyLinks = "buy_links"
        case bookUri = "book_uri"
    }
}

struct Isbns: Codable {
    let isbnTen: String
    let isbnThirteen: String
    
    enum CodingKeys: String, CodingKey {
        case isbnTen = "isbn10"
        case isbnThirteen = "isbn13"
    }
}
