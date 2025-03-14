//
//  HeroDescriptionViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 14/03/2025.
//

import UIKit

class HeroDescriptionViewController: UIViewController {
    
    var heroData: Hero?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var heroDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let hero = heroData else {
            return
        }
        // Do any additional setup after loading the view.
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        
        ImageProcessor.shared.getImage(fromURL: hero.photo) { result in
            guard let image = result else {
                return
            }
            self.imageView.image = image
            
        }
        
        heroDescription.text = hero.description
        
    }
    

    

}
