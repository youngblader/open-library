//
//  Di.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
//

import UIKit

final class Di {
    static let shared = Di()
    
    //MARK: Services
    var booksService: BooksServiceProtocol
    
    var router: RouterProtocol
    var screenFactory: ScreenFactoryProtocol
    
    init() {
        booksService = BooksService()
        router = Router()
        screenFactory = ScreenFactory()
        
        screenFactory.di = self
        router.di = self
    }
}

extension Di {
    func makeWindowWithController(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: scene)
        
        let rootViewController = screenFactory.createBooksController()
        window.rootViewController = rootViewController
        
        return window
    }
}
