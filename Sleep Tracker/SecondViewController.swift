//
//  SecondViewController.swift
//  Sleep Tracker
//
//  Created by Richard Peralta on 5/10/20.
//  Copyright © 2020 Richard Peralta. All rights reserved.
//

import UIKit

public var ratingArray = [Int]()
public var rating: Int = 0


class SecondViewController: UIViewController {
    
    var cellDateFormatter = DateFormatter()

    
    @IBOutlet weak var sleepRater: UIView!
    @IBOutlet weak var raterBlur: UIVisualEffectView!
    @IBOutlet weak var ratingTracker: UITableView!
    
    @IBAction func submitRating(_ sender: UIButton!) {
        sleepRater.isHidden = true
        raterBlur.isHidden = true
        ratingTracker.reloadData()
    }
    @IBAction func rating1(_ sender: UIButton) {
        rating = 1
        ratingArray.append(rating)
    }
    @IBAction func rating2(_ sender: UIButton) {
        rating = 2
        ratingArray.append(rating)

    }
    @IBAction func rating3(_ sender: UIButton) {
        rating = 3
        ratingArray.append(rating)

    }
    @IBAction func rating4(_ sender: UIButton) {
        rating = 4
        ratingArray.append(rating)

    }
    @IBAction func rating5(_ sender: UIButton) {
        rating = 5
        ratingArray.append(rating)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sleepRater.isHidden = false
        cellDateFormatter.dateStyle = .short
        cellDateFormatter.timeStyle = .none
       ratingTracker.delegate = self
       ratingTracker.dataSource = self
        }

}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource
{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(ratingArray.count)
        return ratingArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: customCell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        
        let cellDate = UILabel(frame: CGRect.init(x: 10, y: 5, width: 70, height: 40))
        cell.addSubview(cellDate)
        cellDate.text = cellDateFormatter.string(from: Date())
        
        let cellRatingContent = UILabel(frame: CGRect.init(x: 40, y: 20, width: 150, height: 50))
        cell.addSubview(cellRatingContent)
        
        cell.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        switch rating {
        case 1:
            cellRatingContent.text = "Terrible night's sleep"
        case 2:
            cellRatingContent.text = "Bad night's sleep"
        case 3:
            cellRatingContent.text = "Okay night's sleep"
        case 4:
            cellRatingContent.text = "Good night's sleep"
        case 5:
            cellRatingContent.text = "Great night's sleep"
        default:
            break
        }
        print("ran")
        return cell
    }
    
    
}
