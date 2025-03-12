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
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit() {
        if let loginView = Bundle.main.loadNibNamed("LoginView", owner: self)?.first as? UIView {
            loginView.frame = self.bounds
            addSubview(loginView)
        }
            
            
    }
}
