//
//  BooksDetailsViewController.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit

final class BooksDetailsViewController: UIViewController {
    var data: (book: Book, publishDate: String)?
    
    private var detailBookView: DetailBookView {
        return self.view as! DetailBookView
    }
    
    override func loadView() {
        self.view = DetailBookView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let (book, publishDate) = data {
            detailBookView.update((book, publishDate))
        }
    }
}
