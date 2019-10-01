//
//  GenericoViewController.swift
//  MINavegationController
//
//  Created by Rojano Arenas Gabriela Jaquelina on 9/30/19.
//  Copyright © 2019 Rojano Arenas Gabriela Jaquelina. All rights reserved.
//

import UIKit

class GenericoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        labelCuenta.text = String((parent as! CuentaNavigationViewController).cuentaDePushes)

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelCuenta: UILabel!
    
    @IBAction func botonSiguiente() {
        (parent as! CuentaNavigationViewController).cuentaDePushes += 1
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelCuenta.text = String((parent as! CuentaNavigationViewController).cuentaDePushes)
    }
    
    @IBAction func regresoACasa(_ sender: UIStoryboardSegue) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
