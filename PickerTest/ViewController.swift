//
//  ViewController.swift
//  PickerTest
//
//  Created by tommylmiles on 8/2/18.
//  Copyright © 2018 tommylmiles. All rights reserved.
//

import UIKit
import UserNotifications

var clockInfo = Date()

class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBAction func Picker(_ sender: UIDatePicker) {
        
        clockInfo = sender.date
        configDate()
        
    }
    
   @IBAction func getDate(_ sender: Any) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]){(granted,error) in }
        let current = UNUserNotificationCenter.current()
        current.delegate = self
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configDate(){
        
        let content = UNMutableNotificationContent()
        content.title = "Quote of the Day"
        content.body = "We Did IT"
        content.sound = UNNotificationSound.default()
        
        let selectedDate = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        
        var dateComp = DateComponents()
        dateComp.hour = selectedDate.hour
        dateComp.minute = selectedDate.minute
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComp, repeats: true)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "TestIdentifier" {
            print("handling notifications with the TestIdentifier Identifier")
        }
        
        completionHandler()
        
    }


}

