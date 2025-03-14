//
//  HeroesTableViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 12/03/2025.
//

import UIKit

class HeroesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet var heroTable: UITableView!
    
    
    private var heroDB: [Hero] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        APICaller.shared.getHeroes(){ result in
            
            switch result {
            case .success(let heroes):
                self.heroDB = heroes
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.heroTable.reloadData()
            }
            
        }
        configureTable()
        
    }
    
    
    
    func setTableDelegates() {
        heroTable.delegate = self
        heroTable.dataSource = self
    }
    
    func configureTable(){
        setTableDelegates()
        
        heroTable.register(UINib(nibName: "HeroCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
        
    }
    
   
    //Table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Number of rows
        
        return heroDB.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Populate with cells
        let tableCell = heroTable.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroCell
        
        
        
        
        
        let hero = self.heroDB[indexPath.row]
        
        heroTable.rowHeight = tableCell.contentView.frame.height
        
        tableCell.heroNameLabel.text = hero.name
        tableCell.heroDescriptionLabel.text = hero.description
        ImageProcessor.shared.getImage(fromURL: hero.photo) { result in
            guard let image = result else {
                return
            }
            tableCell.heroImageView.image = image
            
        }
        
        
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        heroTable.deselectRow(at: indexPath, animated: true)
        
        let selectedHero = self.heroDB[indexPath.row]
        
        let descriptionView = HeroDescriptionViewController(nibName: "HeroDescriptionView", bundle: nil)
        descriptionView.heroData = selectedHero
        self.navigationController?.pushViewController(descriptionView, animated: true)
        
    }


}
