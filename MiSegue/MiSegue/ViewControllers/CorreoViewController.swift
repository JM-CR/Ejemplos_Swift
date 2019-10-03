//
//  ViewController.swift
//  MiSegue
//
//  Created by Contreras Rocha Josue Mosiah on 10/2/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class CorreoViewController: UIViewController {

    @IBOutlet weak var labelDeCorreo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func temporizador() {
        _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { timer in
            self.performSegue(withIdentifier: "editar", sender: self)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editar" {
            if let destinoVC = (segue.destination as? EditorViewController) {
                destinoVC.textoRecibido = self.labelDeCorreo.text
            }
        }
    }
}

