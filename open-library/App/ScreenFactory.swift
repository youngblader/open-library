//
//  ScreenFactory.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
//

import UIKit

protocol ScreenFactoryProtocol {
    var di: Di! { get set }
    
    func createBooksController() -> UINavigationController
    func createBookDetailsController() -> BookDetailsViewController
}

final class ScreenFactory: ScreenFactoryProtocol {
    weak var di: Di!
    
    func createBooksController() -> UINavigationController {
        let controller = BooksViewController()
        
        let service: BooksService = di.booksService as! BooksService
        let presenter = BooksPresenter(bookService: service, router: di.router as! Router)

        presenter.view = controller
        controller.output = presenter

        return UINavigationController(rootViewController: controller)
    }
    
    func createBookDetailsController() -> BookDetailsViewController {
        let controller = BookDetailsViewController()
        
        let presenter = BooksDetailsPresenter()

        presenter.view = controller
        controller.output = presenter
        
        return controller
    }
}
