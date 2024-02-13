//
//  BooksDetailsPresenter.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
//

import UIKit
import Foundation

//Input interface
protocol BooksDetailsViewInput: AnyObject {
    func updateDetailsBook(_ data: EditionDetailsBook)
}

//Output interface
protocol BooksDetailsViewOutput: AnyObject {
    func updateBookDetails(_ data: EditionDetailsBook)
}

final class BooksDetailsPresenter {
    weak var view: BooksDetailsViewInput?
    
//    private var bookService: BooksService
//
//    init(bookService: BooksService) {
//        self.bookService = bookService
//    }
}

//MARK: - Actions (ViewOutput)
extension BooksDetailsPresenter: BooksDetailsViewOutput {
    func updateBookDetails(_ data: EditionDetailsBook) {
        self.view?.updateDetailsBook(data)
    }
}
