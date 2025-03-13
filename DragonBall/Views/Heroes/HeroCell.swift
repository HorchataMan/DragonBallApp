//
//  HeroCell.swift
//  DragonBall
//
//  Created by Jan Petrina on 13/03/2025.
//

import UIKit

class HeroCell: UITableViewCell {

    
    @IBOutlet var heroNameLabel: UILabel!
    
    @IBOutlet var heroDescriptionLabel: UILabel!
    
    @IBOutlet var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
