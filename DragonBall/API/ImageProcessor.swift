//
//  ImageProcessor.swift
//  DragonBall
//
//  Created by Jan Petrina on 13/03/2025.
//

import Foundation
import UIKit

class ImageProcessor {
    
    static let shared = ImageProcessor()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    public func getImage(fromURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Invalid Image Data")
                completion(nil)
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("Error converting data to image")
                completion(nil)
                return
            }
            
            self.imageCache.setObject(image, forKey: urlString as NSString)
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }
        task.resume()
        
    }
}
