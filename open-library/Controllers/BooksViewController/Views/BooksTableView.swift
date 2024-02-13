//
//  BooksTableView.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit

final class BooksTableView: UITableView {
    private var editionBooksData = EditionBooks(books: [], publishDate: "")
    
    var onBookTapped: ((EditionDetailsBook)->())?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        self.register(BookCell.self, forCellReuseIdentifier: BookCell.reuseId)
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ data: EditionBooks) {
        self.editionBooksData = data
        self.reloadData()
    }
}

extension BooksTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = editionBooksData.books[indexPath.row]
        let data: EditionDetailsBook = (item, editionBooksData.publishDate)
    
        onBookTapped?(data)
        
        let indexesToRedraw = [indexPath]
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editionBooksData.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: BookCell.reuseId , for: indexPath) as! BookCell
        
        let item = editionBooksData.books[indexPath.row]
        
        cell.update((item, editionBooksData.publishDate))
        
        return cell
    }
}
