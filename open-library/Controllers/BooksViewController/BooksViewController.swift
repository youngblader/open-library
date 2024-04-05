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
    
    //MARK: - Views
    private var booksTableView = BooksTableView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
        setupConstraints()
        
        output?.getBooks()
        
        booksTableView.onBookTapped = { [weak self] data in
            guard let self = self else { return }
            self.output?.presentBookDetails(data, self)
        }
    }
}

//MARK: - BooksViewInput
extension BooksViewController: BooksViewInput {
    func updateBooks(_ data: EditionBooks) {
        booksTableView.update(data)
    }
}

//MARK: - SetupViews
private extension BooksViewController {
    func setup() {
        self.title = "Books Library"
    }
    
    func setupViews() {
        view.addSubview(booksTableView)
    }
    
    func setupConstraints() {
        booksTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
