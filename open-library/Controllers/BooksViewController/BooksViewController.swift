//
//  BooksViewController.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit

final class BooksViewController: UIViewController {
    var output: BooksViewOutput?
    private var booksTableView = BooksTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
        setupConstraints()
        
        output?.getBooks()
        
        booksTableView.onBookTapped = { data in
            self.output?.presentBookDetails(data, self)
        }
    }
}

//MARK: BooksViewInput
extension BooksViewController: BooksViewInput {
    func updateBooks(_ data: EditionBooks) {
        booksTableView.update(data)
    }
}

extension BooksViewController {
    private func setup() {
        self.title = "Books Library"
    }
    
    private func setupViews() {
        self.view.addSubview(booksTableView)
    }
    
    private func setupConstraints() {
        booksTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
