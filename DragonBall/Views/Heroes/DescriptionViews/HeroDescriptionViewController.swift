//
//  HeroDescriptionViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 14/03/2025.
//

import UIKit

class HeroDescriptionViewController: UIViewController {
    
    var heroData: Hero?
    
    var heroTransformations: [Transformation]?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var heroDescription: UILabel!
    
    @IBOutlet var nameLabel: UILabel!

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
        
        showTransformationButton(forHero: hero)
        
        nameLabel.text = hero.name
        heroDescription.text = hero.description
        
    }
    
    func showTransformationButton(forHero hero: Hero) {
        APICaller.shared.getTransformations(hero.id) { result in
            
            switch result {
            case .success(let transformations):
                self.heroTransformations = transformations
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                guard let transformations = self.heroTransformations else {
                    print("Transformations is nil")
                    return
                }
                
                if !transformations.isEmpty {
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                        image: UIImage(systemName: "flame.fill"),
                        style: .done,
                        target: self,
                        action: #selector(self.tappedTransformationButton)
                    )
                    self.navigationItem.rightBarButtonItem?.tintColor = .dbOrange
                }
            }
            
        }
    }
    
    @objc func tappedTransformationButton(){
        guard let transformations = heroTransformations else {
            return
        }
        
        if !transformations.isEmpty {
            let transformationTableView = TransformationViewController(nibName: "TransformationViewController", bundle: nil)
            
            transformationTableView.transformations = transformations
            
            navigationController?.pushViewController(transformationTableView, animated: true)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .dbOrange
    }

    

}
