//
//  LibraryViewController.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit

final class LibraryViewController: UIViewController {
    private var libraryService = LibraryService()

    private var libraryView: LibraryView {
        return self.view as! LibraryView
    }
    
    override func loadView() {
        self.view = LibraryView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchLibraryBooks()
        
        libraryView.libraryTableView.onTappedBook = { data in
            self.showDetailBook(data)
        }
    }
    
    private func fetchLibraryBooks() {
        Task {
            do {
                let response = try await libraryService.fetchBooks()
                
                let data: EditionBook = EditionBook(books: response.results.books, publishDate: response.results.publishedDate)
                
                libraryView.update(data)
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
    
    private func setup() {
        self.title = "Library"
    }
}
