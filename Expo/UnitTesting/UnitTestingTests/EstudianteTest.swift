//
//  EstudianteTest.swift
//  UnitTestingTests
//
//  Created by Contreras Rocha Josue Mosiah on 10/17/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import XCTest
@testable import UnitTesting

class EstudianteTest: XCTestCase {
    
    func testValidFirstName() {
        let estudiante = Estudiante(firstName: "AJ", lastName: "Simon")
        XCTAssertFalse(estudiante.validFirstName())
    }
    
    func testValidLastName() {
        let estudiante = Estudiante(firstName: "AJ", lastName: "Simon")
        XCTAssertTrue(estudiante.validLastName())
    }
    
    func testAddFriend() {
        let aj = Estudiante(firstName: "AJ", lastName: "Simon")
        let tom = Estudiante(firstName: "Tom", lastName: "Karwacki")
        
        XCTAssertTrue(aj.friends.count == 0)
        aj.addFriend(friend: tom)
        XCTAssertTrue(aj.friends.count > 0)
    }
    
}
