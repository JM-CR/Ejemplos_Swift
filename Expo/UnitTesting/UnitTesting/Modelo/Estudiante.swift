//
//  Estudiante.swift
//  UnitTesting
//
//  Created by Contreras Rocha Josue Mosiah on 10/17/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import Foundation

class Estudiante {
    private let firstName: String
    private let lastName: String
    var friends = [Estudiante]()
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func addFriend(friend: Estudiante) {
        friends.append(friend)
    }
    
    func validFirstName() -> Bool {
        return self.firstName.count > 3
    }
    
    func validLastName() -> Bool {
        return self.lastName.count > 3
    }
}
