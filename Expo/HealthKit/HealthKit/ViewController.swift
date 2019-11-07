//
//  ViewController.swift
//  HealthKit
//
//  Created by Contreras Rocha Josue Mosiah on 11/4/19.
//  Copyright © 2019 Contreras Rocha Josue Mosiah. All rights reserved.
//

import UIKit
import CoreLocation
import HealthKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDist: UILabel!
    @IBOutlet weak var labelBirthDate: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelBodyFatPerc: UILabel!
    
    var timer = Timer()
    var zeroTime = TimeInterval()
    var distanceTraveled = 0.0
    var lastLocation: CLLocation?
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        zeroTime = Date.timeIntervalSinceReferenceDate
        
        // Autorización
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Perdón Nathan =(")
        }
        
        // Iniciar tracking
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func buttonStop(_ sender: Any) {
        timer.invalidate()
        locationManager.stopUpdatingLocation()
        distanceTraveled = 0.0
        lastLocation = nil
    }
    
    @objc func updateTime() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        var timePassed = currentTime - zeroTime
        let minutes = UInt16(timePassed) / 60
        timePassed -= TimeInterval(minutes) * 60
        let seconds = UInt16(timePassed)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        labelTime.text = "\(strMinutes):\(strSeconds)"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        if lastLocation == nil {
            distanceTraveled = 0
        } else {
            distanceTraveled += newLocation.distance(from: lastLocation!)
        }
        self.lastLocation = newLocation
        self.labelDist.text = String(format: "%02 g", distanceTraveled)
    }
    
    func authorize() {
        
    }
}

