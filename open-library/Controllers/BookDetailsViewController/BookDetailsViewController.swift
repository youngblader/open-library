//
//  BooksDetailsViewController.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit

final class BookDetailsViewController: UIViewController {
    var output: BooksDetailsPresenter?
    
    var detailsBookData: EditionDetailsBook?
    
    private let titleLabel = TextLabel(size: 16, weight: .bold)
    private let publishDateLabel = TextLabel(size: 14, color: .gray, weight: .medium)
    private let descriptionLabel = TextLabel(size: 16, color: .gray, weight: .medium)
    
    private let ratingView = RatingView()
    
    private let coverImageView: UIImageView = {
        let imageView =  UIImageView()
        
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        return imageView
    }()
    
    private let aboutBookStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 4
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
        setupConstraints()
        
        if let detailsBookData {
            self.output?.updateBookDetails(detailsBookData)
        }
    }
    
    //MARK: Public update
    func update(_ data: EditionDetailsBook) {
        let (book, publishDate) = data
        
        coverImageView.kf.setImage(with: URL(string: book.bookImage))
        titleLabel.text = book.title
        descriptionLabel.text = book.description
        publishDateLabel.text = publishDate
        
        ratingView.update(book.rank)
    }
}

//MARK: BooksViewInput
extension BookDetailsViewController: BooksDetailsViewInput {
    func updateDetailsBook(_ data: EditionDetailsBook) {
        self.update(data)
    }
}

extension BookDetailsViewController {
    private func setup() {
        self.view.backgroundColor = .white
    }
    
    private func setupViews() {
        self.view.addSubview(coverImageView)
        self.view.addSubview(aboutBookStackView)
        self.view.addSubview(ratingView)
        
        aboutBookStackView.addArrangedSubview(titleLabel)
        aboutBookStackView.addArrangedSubview(descriptionLabel)
        aboutBookStackView.addArrangedSubview(publishDateLabel)
    }
    
    private func setupConstraints() {
        coverImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
        }
        
        aboutBookStackView.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(20)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(aboutBookStackView.snp.bottom).offset(10)
            make.left.equalTo(view).inset(20)
        }
    }
}
