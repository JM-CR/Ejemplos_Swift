//
//  ViewController.swift
//  tvExample
//
//  Created by Contreras Rocha Josue Mosiah on 10/24/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func opcionIncorrecta(_ sender: Any) {
        print("Opción incorrecta :(")
    }
    
    @IBAction func opcionCorrecta(_ sender: UIButton) {
        print("Correcto :)")
    }
}

