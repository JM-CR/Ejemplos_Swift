//
//  ViewController.swift
//  Mis Vistas
//
//  Created by Contreras Rocha Josue Mosiah on 9/2/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let miRect = CGRect(x: 30, y: 30, width: 50, height: 50)
        let vista1 = UIView(frame: miRect)
        vista1.backgroundColor = .brown
        view.subviews[0].subviews[0].addSubview(vista1)
    }


}

