//
//  Router.swift
//  open-library
//
//  Created by Евгений Зорич on 13.02.24.
//

import UIKit

protocol RouterProtocol {
    var di: Di! { get set }
    
    func navigateToBookDetailsController(_ data: EditionDetailsBook, _ from: UIViewController)
}

final class Router: RouterProtocol {
    weak var di: Di!
    
    func navigateToBookDetailsController(_ data: EditionDetailsBook, _ from: UIViewController) {
        let vc = di.screenFactory.createBookDetailsController()
        
        vc.detailsBookData = data
        
        from.present(vc, animated: true)
    }
}
