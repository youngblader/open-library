//
//  TextLabel.swift
//  open-library
//
//  Created by Eugene on 15.04.23.
//

import UIKit

final class TextLabel: UILabel {
    private var textLabel: String
    private var color: UIColor
    private var weight: UIFont.Weight
    private var size: CGFloat
    
    init(label: String = "", size: CGFloat = 16, color: UIColor = .black, weight: UIFont.Weight = .light) {
        self.textLabel = label
        self.size = size
        self.color = color
        self.weight = weight
        
        super.init(frame: .zero)

        self.configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextLabel {
    private func configureLabel() {
        self.text = textLabel
        self.textColor = color
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
}
