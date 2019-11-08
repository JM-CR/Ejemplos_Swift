//
//  ViewController.swift
//  ToDoList
//
//  Created by José Castellanos Ramos on 11/7/19.
//  Copyright © 2019 José Castellanos Ramos. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "CellId"
    var taskR = [Task]()   // Guarda resultados del query

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callDelegates()
        
        // Propieades de la tabla
        tableView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.refreshTable()
        tableView.reloadData()
    }
    
    func callDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    func refreshTable() {
        self.getTasks { done in
            if done && taskR.count > 0 {
                tableView.isHidden = false
            } else if done && taskR.count == 0 {
                tableView.isHidden = true
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Obtener item
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let task = self.taskR[indexPath.row]
        
        // Formatear celda
        cell.taskLabel.text = task.taskDescription
        
        if task.taskStatus {
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            cell.taskLabel.textColor = .black
        } else {
            cell.backgroundColor = .white
            cell.taskLabel.textColor = .black
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let borrar = UITableViewRowAction(style: .destructive, title: "Eliminar") { (action, indexPath) in
            self.deleteTasks(indexPath: indexPath)
            self.refreshTable()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        borrar.backgroundColor = .red
        
        let actualizar = UITableViewRowAction(style: .destructive, title: "Actualizar") { (action, indexPath) in
            self.update(indexPath: indexPath)
            self.refreshTable()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        actualizar.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        return [borrar, actualizar]
    }
}

extension ViewController {
    
    func getTasks(completion: (_ finished: Bool) -> ()) {
        // Referencia al app delegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        // Preparar query para obtener registros
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        // Mandar query
        do {
            self.taskR = try managedContext.fetch(request) as! [Task]
            print("Lectura correcta")
            completion(true)
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    func deleteTasks(indexPath: IndexPath) {
        // Referencia al app delegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        // Borrar registro
        managedContext.delete(self.taskR[indexPath.row])
        
        // Sincronizar modelo
        do {
            try managedContext.save()
            print("Borrado exitosa.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update(indexPath: IndexPath) {
        // Referencia al app delegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        // Editar registro
        let task = self.taskR[indexPath.row]
        if task.taskStatus {
            task.taskStatus = false
        } else {
            task.taskStatus = true
        }
        
        // Sincronizar modelo
        do {
            try managedContext.save()
            print("Actualización exitosa.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
