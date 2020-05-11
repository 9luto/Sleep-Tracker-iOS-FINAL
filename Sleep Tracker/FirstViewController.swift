//
//  FirstViewController.swift
//  Sleep Tracker
//
//  Created by Richard Peralta on 5/10/20.
//  Copyright © 2020 Richard Peralta. All rights reserved.
//

import UIKit

public var formatter = DateFormatter()

class FirstViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var userWakeUp: UIDatePicker!
    @IBOutlet weak var sleepPrint: UILabel!
    @IBAction func calcButton(_ sender: UIButton) {
        let wakeUpTime = userWakeUp.date
              let sleepTime = wakeUpTime.addingTimeInterval(-27000)
              let sleepTimeAlt = wakeUpTime.addingTimeInterval(-32400)
              let sleepString = "you should to go sleep at: " + formatter.string(from: sleepTime) + " or " + formatter.string(from: sleepTimeAlt) + " to feel refreshed in the morning"
              
              sleepPrint.text = sleepString
    }
    
     @objc public func updateClock()
    {
        let currentDateTime = Date()
        clock.text = formatter.string(from: currentDateTime)
    }
}

