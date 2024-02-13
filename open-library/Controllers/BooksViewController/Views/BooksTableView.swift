//
//  BooksTableView.swift
//  open-library
//
//  Created by Eugene on 14.04.23.
//

import UIKit

final class BooksTableView: UITableView {
    private var editionBook = EditionBook(books: [], publishDate: "")
    
    var onTappedBook: (((Book, String))->())?
    
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
    func update(_ data: EditionBook) {
        self.editionBook =  data
        
        self.reloadData()
    }
}

extension BooksTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = editionBook.books[indexPath.row]

        onTappedBook?((item, editionBook.publishDate))
        
        let indexesToRedraw = [indexPath]
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editionBook.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: BookCell.reuseId , for: indexPath) as! BookCell
        
        let item = editionBook.books[indexPath.row]
        
        cell.update((item, editionBook.publishDate))
        
        return cell
    }
}
