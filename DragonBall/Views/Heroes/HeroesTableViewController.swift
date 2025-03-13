//
//  HeroesTableViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 12/03/2025.
//

import UIKit

class HeroesTableViewController: UIViewController {
    
    @IBOutlet var heroTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        APICaller.shared.getHeroes(){ result in
            
            switch result {
            case .success(let heroes):
                for hero in heroes {
                    print(hero.name)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    


}
