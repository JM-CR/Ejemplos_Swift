//
//  AddTaskController.swift
//  ToDoList
//
//  Created by José Castellanos Ramos on 11/7/19.
//  Copyright © 2019 José Castellanos Ramos. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {

    @IBOutlet weak var taskText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func guardarTarea(_ sender: Any) {
        guardar { done in
            if done {
                navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func guardar(completion: (_ finished: Bool) -> ()) {
        // Referencia al app delegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        // Obtener registro
        let task = Task(context: managedContext)
        task.taskDescription = taskText.text
        task.taskStatus = false
        
        // Insertar registro
        do {
            try managedContext.save()
            print("Datos creados con éxito.")
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
}
