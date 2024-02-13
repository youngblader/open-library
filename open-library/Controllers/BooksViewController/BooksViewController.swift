//
//  BooksViewController.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit

final class BooksViewController: UIViewController {
    private var libraryService = LibraryService()
    
    var libraryTableView = LibraryTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
        setupConstraints()
        
        fetchLibraryBooks()
        
        libraryTableView.onTappedBook = { data in
            self.showDetailBook(data)
        }
    }
    
    private func fetchLibraryBooks() {
        Task {
            do {
                let response = try await libraryService.fetchBooks()
                
                let data: EditionBook = EditionBook(books: response.results.books, publishDate: response.results.publishedDate)
                
                update(data)
            } catch {
                print(error)
            }
        }
    }
    
    private func showDetailBook(_ data: (book: Book, publishDate: String)) {
        let controller = DetailBookViewController()
        controller.data = data
        
        present(controller, animated: true)
    }
    
    //MARK: Public update
    func update(_ data: EditionBook) {
        libraryTableView.update(data)
    }
}

extension BooksViewController {
    private func setup() {
        self.title = "Library"
    }
    
    private func setupViews() {
        self.view.addSubview(libraryTableView)
    }
    
    private func setupConstraints() {
        libraryTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
}
