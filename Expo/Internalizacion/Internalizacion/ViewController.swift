//
//  ViewController.swift
//  Internalizacion
//
//  Created by Contreras Rocha Josue Mosiah on 10/17/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDeTexto: UILabel!
    @IBOutlet weak var labelHola: UILabel!
    @IBOutlet weak var labelMoneda: UILabel!
    @IBOutlet weak var labelMXN: UILabel!
    @IBOutlet weak var botonPresiona: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inicializarValores()
        
        self.labelDeTexto.text = NSLocalizedString("LText", comment: "")
        self.labelHola.text = NSLocalizedString("LHola", comment: "")
        self.labelMoneda.text = NSLocalizedString("LMoneda", comment: "")
        self.labelMXN.text = NSLocalizedString("LMXN", comment: "")
        self.botonPresiona.setTitle(NSLocalizedString("BPresiona", comment: ""), for: .normal)
    }
    
    
    private func inicializarValores() {
        self.labelDeTexto.text = NSLocalizedString("LText", comment: "")
        self.labelHola.text = NSLocalizedString("LHola", comment: "")
        self.labelMoneda.text = NSLocalizedString("LMoneda", comment: "")
        self.labelMXN.text = NSLocalizedString("LMXN", comment: "")
        self.botonPresiona.setTitle(NSLocalizedString("BPresiona", comment: ""), for: .normal)
    }
}

