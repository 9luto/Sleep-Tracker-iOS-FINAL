//
//  FirstViewController.swift
//  Sleep Tracker
//
//  Created by Richard Peralta on 5/10/20.
//  Copyright © 2020 Richard Peralta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let formatter = DateFormatter()
 
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
    @IBAction func wakeUpChosen(_ sender: UIDatePicker) {

        let wakeUpTime = userWakeUp.date
        let sleepTime = formatter.string(from: wakeUpTime.addingTimeInterval(5 * 90))
        let sleepTimeAlt = formatter.string(from: wakeUpTime.addingTimeInterval(6 * 90))
        
        let sleepString = "you should to go sleep at: " + sleepTime + "or" + sleepTimeAlt + "to feel refreshed in the morning"
        
        sleepPrint.text = sleepString
    }
    @IBOutlet weak var sleepPrint: UILabel!
    
     @objc public func updateClock()
    {
        let currentDateTime = Date()
        clock.text = formatter.string(from: currentDateTime)
    }
}

