//
//  ViewController.swift
//  DragonBall
//
//  Created by Jan Petrina on 11/03/2025.
//

import UIKit

protocol MyViewDelegate: AnyObject {
    func navigateToNewViewController(viewController: UIViewController)
}

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
//    func navigateToNewViewController(viewController: UIViewController) {
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }


}

