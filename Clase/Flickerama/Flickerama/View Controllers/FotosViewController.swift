//
//  FotosViewController.swift
//  Flickerama
//
//  Created by Contreras Rocha Josue Mosiah on 11/25/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class FotosViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    
    let listaDeFotos = ListaDeFotos()
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaDeFotos.traerFotosRecientes()
    }
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
