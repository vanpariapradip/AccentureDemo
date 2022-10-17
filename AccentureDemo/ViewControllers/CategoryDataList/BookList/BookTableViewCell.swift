//
//  BookTableViewCell.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 18/10/22.
//

import UIKit

class BookTableViewCell: UITableViewCell, CategoryDataCellProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var isbnLbl: UILabel!
    @IBOutlet weak var authorsLbl: UILabel!
    @IBOutlet weak var numberOfPagesLbl: UILabel!
    @IBOutlet weak var publisherLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var mediaTypeLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!

    
    func setup(_ data: CategoryData) {
        guard let book = data as? Book else {
            nameLbl.text = ""
            isbnLbl.text = ""
            authorsLbl.text = ""
            numberOfPagesLbl.text = ""
            publisherLbl.text = ""
            countryLbl.text = ""
            mediaTypeLbl.text = ""
            releasedLbl.text = ""
            return
        }
        
        nameLbl.text = book.name
        isbnLbl.text = book.isbn
        authorsLbl.text = book.authors.joined(separator: ", ")
        numberOfPagesLbl.text = String(book.numberOfPages)
        publisherLbl.text = book.publisher
        countryLbl.text = book.country
        mediaTypeLbl.text = book.mediaType
        releasedLbl.text = book.released
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
