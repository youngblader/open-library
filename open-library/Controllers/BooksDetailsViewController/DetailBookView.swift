//
//  DetailBookView.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailBookView: UIView {
    var data: (book: Book, publishDate: String)?
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ data: (book: Book, publishDate: String)) {
        let (book, publishDate) = data
    
        coverImageView.kf.setImage(with: URL(string: book.bookImage))
        titleLabel.text = book.title
        descriptionLabel.text = book.description
        publishDateLabel.text = publishDate

        ratingView.update(book.rank)
    }
}

extension DetailBookView {
    private func setup() {
        self.backgroundColor = .white
    }
    
    private func setupViews() {
        self.addSubview(coverImageView)
        self.addSubview(aboutBookStackView)
        self.addSubview(ratingView)
        
        aboutBookStackView.addArrangedSubview(titleLabel)
        aboutBookStackView.addArrangedSubview(descriptionLabel)
        aboutBookStackView.addArrangedSubview(publishDateLabel)
    }
    
    private func setupConstraints() {
        coverImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
        }
        
        aboutBookStackView.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(20)
            make.left.right.equalTo(self).inset(20)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(aboutBookStackView.snp.bottom).offset(10)
            make.left.equalTo(self).inset(20)
        }
    }
}
