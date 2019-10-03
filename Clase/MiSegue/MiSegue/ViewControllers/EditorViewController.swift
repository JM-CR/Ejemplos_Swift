//
//  EditorViewController.swift
//  MiSegue
//
//  Created by Contreras Rocha Josue Mosiah on 10/2/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController, UITextFieldDelegate {

    var textoRecibido: String?
    @IBOutlet weak var botonOk: UIButton!
    @IBOutlet weak var campoDeEdicion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.campoDeEdicion.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.campoDeEdicion.text = (presentingViewController as! CorreoViewController).labelDeCorreo.text
        self.campoDeEdicion.text = self.textoRecibido
    }
    
    @IBAction func ok() {
        if (self.campoDeEdicion.text?.isEmpty)! {
            self.botonOk.isEnabled = false
        } else {
            (presentingViewController as! CorreoViewController).labelDeCorreo.text = self.campoDeEdicion.text
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Resultado descartable
    @discardableResult func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (campoDeEdicion.text?.isEmpty)! {
            self.botonOk.isEnabled = false
            return false
        }
        
        self.botonOk.isEnabled = true
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tapRecibido(_ sender: UITapGestureRecognizer) {
        self.textFieldShouldReturn(self.campoDeEdicion)
    }
}
