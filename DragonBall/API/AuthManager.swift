//
//  AuthManager.swift
//  DragonBall
//
//  Created by Jan Petrina on 12/03/2025.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    private let baseUrl = "https://dragonball.keepcoding.education/"
    
    var token: String?
    
    func login(user: String,
               password: String,
               completion: @escaping (Bool) -> Void){
        let loginEndpoint = "api/auth/login"
        
        guard let url = URL(string: baseUrl + loginEndpoint) else {
            print("Invalid URL")
            completion(false)
            return
        }
        
        //String format = email:password
        
        let formatedString = String(format: "%@:%@", user, password)
        
        guard let loginData = formatedString.data(using: .utf8) else {
            print("Unable to parse string")
            completion(false)
            return
        }
        
        let encodedData = loginData.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(encodedData)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Could not fetch data")
                completion(false)
                return
            }
            
            guard let result = String(data: data, encoding: .utf8) else {
                print("Could not encode data into string")
                completion(false)
                return
            }
            
            let response =  response as? HTTPURLResponse
            
            print(response?.statusCode)
            
            guard response?.statusCode == 200 else {
                completion(false)
                return
            }
            
            self?.token =  result
            
            print(self?.token)
            
            completion(true)
            
        }
        
        task.resume()
    }
}
