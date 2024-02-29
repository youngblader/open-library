//
//  EditionBooks.swift
//  open-library
//
//  Created by Евгений Зорич on 29.02.24.
//

import Foundation

typealias EditionDetailsBook = (book: Book, publishDate: String)

struct EditionBooks {
    var books: [Book]
    var publishDate: String
}
