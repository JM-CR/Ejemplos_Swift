//
//  RecordatorioViewController.swift
//  HipnoHora
//
//  Created by Contreras Rocha Josue Mosiah on 9/23/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import UserNotifications

class RecordatorioViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializar notificación
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (autorizado, error) in
            print("¿El usuario autorizó? \(autorizado) ")
        })
        self.datePicker.minimumDate = Date()
    }
    
    @IBAction func agendarCita() {
        let horaLocal = self.datePicker.date.addingTimeInterval(TimeInterval(TimeZone.current.secondsFromGMT()))
        print(horaLocal)
        
        // Notificaciones del usuario
        let notificacion = UNMutableNotificationContent()
        notificacion.title = "Hipnotizamiento"
        notificacion.body = "Llegó la hora de tu sesión"
        notificacion.badge = 1
//        notificacion.sound = UNNotificationSound.default
        notificacion.sound = UNNotificationSound(named: UNNotificationSoundName("sonido.wav"))
        let disparo = UNCalendarNotificationTrigger.init(
            dateMatching: Calendar.current.dateComponents(
                [.day, .month, .hour, .minute],
                from: datePicker.date
            ), repeats: true
        )
        let request = UNNotificationRequest(identifier: "Hipnosis", content: notificacion, trigger: disparo)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print(request.trigger!)
    }
}
