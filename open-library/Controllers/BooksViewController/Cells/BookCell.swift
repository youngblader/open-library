//
//  BookCell.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit
import Kingfisher

final class BookCell: UITableViewCell {
    static var reuseId = "BookCell"
    
    private let titleLabel = TextLabel(size: 16, weight: .bold)
    private let publishDateLabel = TextLabel(size: 14, color: .gray, weight: .medium)
    
    private let coverImageView: UIImageView = {
        let imageView =  UIImageView()

        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //MARK: Public update
    func update(_ data: (Book, String)) {
        let (book, date) = data

        titleLabel.text = book.title
        publishDateLabel.text = date
        
        coverImageView.kf.setImage(with: URL(string: book.bookImage), options: [
            .cacheOriginalImage,
            .transition(.fade(1))
        ])
    }
}

private extension BookCell {
    func setupViews() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(publishDateLabel)
    }
    
    func setupConstraints() {
        coverImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.left.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.right.equalTo(contentView).inset(10)
            make.left.equalTo(coverImageView.snp.right).offset(4)
        }
        
        publishDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalTo(contentView).inset(10)
            make.left.equalTo(coverImageView.snp.right).offset(4)
        }
    }
}
