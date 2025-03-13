//
//  LoginViewXController.swift
//  DragonBall
//
//  Created by Jan Petrina on 13/03/2025.
//

import UIKit

class LoginViewXController: UIViewController {
    
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.tintColor = .dbBlue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressLoginButton(_ sender: UIButton) {
        
        
        guard let email = email  else {
            print("Please enter an email")
            //print(email)
            return
        }
        guard let password = password else {
            print("Please enter a password")
            //print(password)
            return
        }
        AuthManager.shared.login(user: email, password: password) { [weak self] success in
            DispatchQueue.main.async {
                self?.loginButton.tintColor = success ? .dbOrange : .dbBlue
                print(success)
                
                if success {
                    let heroView = HeroesTableViewController(nibName: "HeroesTableView", bundle: nil)
                    
                    self?.navigationController?.pushViewController(heroView, animated: true)
                }
            }
            
        }
        
        
        
    }
    
    @IBAction func emailTFChanged(_ sender: UITextField) {
        email = sender.text
    }
    @IBAction func passwordTFChanged(_ sender: UITextField) {
        password = sender.text
    }
    
}
