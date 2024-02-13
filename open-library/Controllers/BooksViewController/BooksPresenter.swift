//
//  BooksPresenter.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
//

import UIKit
import Foundation

//Input interface
protocol BooksViewInput: AnyObject {
    func updateBooks(_ data: EditionBooks)
}

//Output interface
protocol BooksViewOutput: AnyObject {
    func getBooks()
    func presentBookDetails(_ data: EditionDetailsBook, _ from: UIViewController)
}

final class BooksPresenter {
    weak var view: BooksViewInput?
    
    private var bookService: BooksService
    private var router: Router
    
    init(bookService: BooksService, router: Router) {
        self.bookService = bookService
        self.router = router
    }
    
    private func fetchBooks() {
        bookService.fetchBooks(completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.view?.updateBooks(EditionBooks(books: response.results.books, publishDate: response.results.publishedDate))
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

//MARK: - Actions (ViewOutput)
extension BooksPresenter: BooksViewOutput {
    func getBooks() {
        self.fetchBooks()
    }
    
    func presentBookDetails(_ data: EditionDetailsBook, _ from: UIViewController) {
        self.router.navigateToBookDetailsController(data, from)
    }
}
