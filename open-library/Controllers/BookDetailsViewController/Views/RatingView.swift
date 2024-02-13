//
//  RatingView.swift
//  open-library
//
//  Created by Eugene on 15.04.23.
//

import UIKit
import SnapKit

final class RatingView: UIView {
    private let maximumRating = 5
    
    private let ratingLabel = TextLabel(size: 14, color: .gray, weight: .medium)
    
    private func createStarImage() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .yellow
        
        return imageView
    }
    
    private var containerStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = 0
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ rating: Int) {
        ratingLabel.text = "Rating \(rating)"
    }
}

extension RatingView {
    private func setupViews() {
        self.addSubview(containerStack)
        self.addSubview(ratingLabel)
        
        for _ in 0..<maximumRating {
            containerStack.addArrangedSubview(createStarImage())
        }
    }
    
    private func setupConstraints() {
        containerStack.snp.makeConstraints { make in
            make.top.left.equalTo(self)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(containerStack.snp.bottom).offset(4)
            make.left.right.equalTo(self)
        }
    }
}
