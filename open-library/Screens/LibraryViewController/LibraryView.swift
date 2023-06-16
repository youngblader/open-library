//
//  LibraryView.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit
import SnapKit

final class LibraryView: UIView {
    var libraryTableView = LibraryTableView()
    
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
    func update(_ data: EditionBook) {
        libraryTableView.update(data)
    }
}

extension LibraryView {
    private func setup() {
        self.backgroundColor = .white
    }
    
    private func setupViews() {
        self.addSubview(libraryTableView)
    }
    
    private func setupConstraints() {
        libraryTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
