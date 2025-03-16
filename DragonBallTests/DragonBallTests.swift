//
//  DragonBallTests.swift
//  DragonBallTests
//
//  Created by Jan Petrina on 11/03/2025.
//

import XCTest
@testable import DragonBall

final class DragonBallTests: XCTestCase {

    
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    func test_login(){
        
        
        AuthManager.shared.login(user: "jancpetrina@gmail.com", password: "Spiderman1") { success in
            //Tests for an actual login
            XCTAssertEqual(success, true)
            
        }
        
        
        
        AuthManager.shared.login(user: "wronguser", password: "wrongpassword") { success in
            //Tests for an incorrect login
            XCTAssertEqual(success, false)
        }
        
        
    }
    
    func test_getHeroName(){
        let heroToGet = "Goku"
        
        //Test to find a hero by name
        
        APICaller.shared.getHeroes(heroToGet) {result in
            switch result {
            case .success(let hero):
                XCTAssertEqual(hero.first?.name, "Goku")
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertThrowsError(APICaller.APIError.couldNotFetchData)
            }
            
        }
    }
    
    func test_getTransformations(){
        
        //If the character has transformations should return true
        //this is tested with goku
        APICaller.shared.getTransformations("D13A40E5-4418-4223-9CE6-D2F9A28EBE94") {
            result in
            
            switch result {
            case .success(let transformations):
                XCTAssertTrue(!transformations.isEmpty)
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertThrowsError(APICaller.APIError.couldNotFetchData)
            }
        }
        
        //If the character has no transformations should return false
        //This is tested with mr satan
        APICaller.shared.getTransformations("1985A353-157F-4C0B-A789-FD5B4F8DABDB") {
            result in
            
            switch result {
            case .success(let transformations):
                XCTAssertTrue(transformations.isEmpty)
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertThrowsError(APICaller.APIError.couldNotFetchData)
            }
        }
        
    }

}
