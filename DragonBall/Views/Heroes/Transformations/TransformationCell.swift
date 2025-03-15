//
//  TransformationCell.swift
//  DragonBall
//
//  Created by Jan Petrina on 15/03/2025.
//

import UIKit

class TransformationCell: UITableViewCell {
    
    @IBOutlet var transformationImage: UIImageView!
    @IBOutlet var transformationName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        transformationImage.layer.cornerRadius = 0
        transformationImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
