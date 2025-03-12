//
//  LoginView.swift
//  DragonBall
//
//  Created by Jan Petrina on 11/03/2025.
//

import Foundation
import UIKit

class LoginView: UIView {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private var emailText: String?
    private var passwordText: String?
    
    
    
    
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailText  else {
            print("Please enter an email")
            //print(emailText)
            return
        }
        guard let password = passwordText else {
            print("Please enter a password")
            //print(passwordText)
            return
        }
        AuthManager.shared.login(user: email, password: password) { [weak self] success in
            DispatchQueue.main.async {
                self?.loginButton.tintColor = success ? .dbOrange : .dbBlue
                print(success)
                
                if success {
                    let heroView = HeroesTableViewController()
                    
                }
            }
            
        }
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        viewInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func viewInit() {
        if let loginView = Bundle.main.loadNibNamed("LoginView", owner: self)?.first as? UIView {
            loginView.frame = self.bounds
            addSubview(loginView)
            loginButton.tintColor = .dbBlue
            
        }
            
            
    }
    
    @IBAction func emailTFChanged(_ sender: UITextField) {
        
        emailText = emailTextField.text
    }
    
    @IBAction func passwordTFChanged(_ sender: UITextField) {
        passwordText = passwordTextField.text
    }
}
