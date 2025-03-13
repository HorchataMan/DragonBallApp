//
//  APICaller.swift
//  DragonBall
//
//  Created by Jan Petrina on 12/03/2025.
//

import Foundation


class APICaller {
    static let shared = APICaller()
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    enum APIError: Error {
        case couldNotFetchData
        case couldNotDecodeData
    }
    
    var token: String?
    
    struct Constants {
        static let server = "https://dragonball.keepcoding.education/"
        
    }
    
    func getHeroes(
        _ name: String = "",
        completion: @escaping (Result<[Hero], Error>) -> Void) {
        
            createRequest(
                with: URL(string: Constants.server + "api/heros/all"),
                type: .POST) { request in
                    
                    var newRequest = request
                    //Create the body for the request
                    let bodyString = """
                                    {
                                        "name": "\(name)"
                                    }
                                    """
                    let jsonBody = bodyString.data(using: .utf8)
                    
                    newRequest.httpBody = jsonBody
                    
                    
                    let task = URLSession.shared.dataTask(with: newRequest) { data, response, error in
                        guard let data = data, error == nil else {
                            completion(.failure(APIError.couldNotFetchData))
                            return
                        }
                        
                        let response = response as? HTTPURLResponse
                        print(response?.statusCode)
                        
                        //If it got the data proceed and decode it
                        
                        do {
                            
                            let result = try JSONDecoder().decode([Hero].self, from: data)
                            
                            completion(.success(result))
                            
                            
                        } catch {
                            completion(.failure(APIError.couldNotDecodeData))
                        }
                    }
                    
                    task.resume()
                    
                } //Here ends the create request
    }
    
    public func createRequest(
        with url: URL?,
        type: HTTPMethod,
        completion: @escaping (URLRequest) -> Void){
            guard let apiURL = url else {
                return
            }
            AuthManager.shared.withValidToken { token in
                var request = URLRequest(url: apiURL)
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.httpMethod = type.rawValue
                request.timeoutInterval = 30
                
                
                
                completion(request)
            }
        }
    
    
}
