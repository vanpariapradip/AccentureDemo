//
//  HouseTableViewCell.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 18/10/22.
//

import UIKit

class HouseTableViewCell: UITableViewCell, CategoryDataCellProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var regionLogo: UIImageView!
    
    func setup(_ data: CategoryData) {
        guard let house = data as? House else {
            nameLbl.text = ""
            regionLbl.text = ""
            titleLbl.text = ""
            regionLogo.image = nil
            return
        }
        nameLbl.text = house.name
        regionLbl.text = house.region
        titleLbl.text = house.title
        regionLogo.setRegionImage(house.region)
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
