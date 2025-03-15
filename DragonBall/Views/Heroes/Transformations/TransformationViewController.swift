//
//  TransformationViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 15/03/2025.
//

import UIKit

class TransformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var transformationTable: UITableView!
    
    var transformations: [Transformation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureTable()
    }
    
    func setDelegates() {
        transformationTable.delegate = self
        transformationTable.dataSource = self
    }
    
    func configureTable(){
        setDelegates()
        
        transformationTable.register(UINib(
            nibName: "TransformationCell",
            bundle: nil),
            forCellReuseIdentifier: "TransformationCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return transformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = transformationTable.dequeueReusableCell(withIdentifier: "TransformationCell", for: indexPath) as! TransformationCell
        
        transformationTable.rowHeight = tableCell.contentView.frame.height
        
        let transformation = transformations[indexPath.row]
        
        tableCell.transformationName.text = transformation.name
        
        ImageProcessor.shared.getImage(fromURL: transformation.photo) { result in
            guard let image = result else {
                return
            }
            tableCell.transformationImage.image = image
            
        }
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transformationTable.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .dbBlue
        
    }
}
