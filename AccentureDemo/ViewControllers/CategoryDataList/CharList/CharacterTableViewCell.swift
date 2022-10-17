//
//  CharacterTableViewCell.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 18/10/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell, CategoryDataCellProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!

    
    func setup(_ data: CategoryData) {
        guard let char = data as? Char else {
            nameLbl.text = ""
            genderLbl.text = ""
            return
        }
        nameLbl.text = char.name
        genderLbl.text = char.gender.rawValue
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
