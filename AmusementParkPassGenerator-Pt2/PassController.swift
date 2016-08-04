//
//  PassController.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 8/3/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import UIKit
import AudioToolbox

class PassController: UIViewController {
    
    @IBOutlet weak var passTitleLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var rideInfoLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchandiseDiscountLabel: UILabel!
    @IBOutlet weak var areaAccessStackView: UIStackView!
    @IBOutlet weak var testResultBG: UIView!
    @IBOutlet weak var testResultLabel: UILabel!
    @IBOutlet weak var birthdayMessageLabel: UILabel!
    
    
    var sound: SystemSoundID = 0
    var pass:Pass? = nil
    var isBirthdayToday: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayPass()
        areaAccessStackView.hidden = true
        birthdayMessageLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayPass() {
        if let validPass = pass {
            passTitleLabel.text = validPass.title
            passTypeLabel.text = validPass.passType
            rideInfoLabel.text = validPass.rideInfo
            foodDiscountLabel.text = validPass.foodDiscountInfo
            merchandiseDiscountLabel.text = validPass.merchandiseDiscountInfo
        }
    }

    @IBAction func areaAccessSwiper(sender: UIButton) {
        areaAccessStackView.hidden = false
        birthdayMessageLabel.hidden = true
        testResultLabel.text = "Test Result"
        resetTestResultColor()
    }
    
    @IBAction func amusementAreaAccessSwiper(sender: UIButton) {
        if let access = pass?.areaAccess.amusement {
            if access == true {
                testResultLabel.text = "Amusement area access allowed."
            } else {
                testResultLabel.text = "Amusement area access not allowed"
            }
            updateTestResultColor(access)
            playSound(access)
        }
    }
    
    @IBAction func kitchenAreaAccessSwiper(sender: UIButton) {
        if let access = pass?.areaAccess.kitchen {
            if access == true {
                testResultLabel.text = "Kitchen area access allowed."
            } else {
                testResultLabel.text = "Kitchen area access not allowed"
            }
            updateTestResultColor(access)
            playSound(access)
        }
    }
    
    @IBAction func rideAreaAccessSwiper(sender: UIButton) {
        if let access = pass?.areaAccess.rideControl {
            if access == true {
                testResultLabel.text = "Ride control area access allowed."
            } else {
                testResultLabel.text = "Ride control area access not allowed"
            }
            updateTestResultColor(access)
            playSound(access)
        }
    }
    
    @IBAction func maintenanceAreaAccessSwiper(sender: UIButton) {
        if let access = pass?.areaAccess.maintenance {
            if access == true {
                testResultLabel.text = "Maintenance area access allowed."
            } else {
                testResultLabel.text = "Maintenance area access not allowed"
            }
            updateTestResultColor(access)
            playSound(access)
        }
    }
    
    @IBAction func officeAreaAccessSwiper(sender: UIButton) {
        if let access = pass?.areaAccess.office {
            if access == true {
                testResultLabel.text = "Office area access allowed."
            } else {
                testResultLabel.text = "Office area access not allowed"
            }
            updateTestResultColor(access)
            playSound(access)
        }
    }
    
    @IBAction func rideAccessSwiper(sender: UIButton) {
        areaAccessStackView.hidden = true
        resetTestResultColor()
        var rideAccessResult: String = ""
        var skipLineAccessResult: String = ""
        if pass?.rideAccess.accessAllRides == true {
            rideAccessResult = "You have access to all rides."
            if pass?.rideAccess.skipAllRideLines == true {
                skipLineAccessResult = "You can skip all ride lines."
            } else {
                skipLineAccessResult = "You can't skip ride lines."
            }
            testResultLabel.text = "\(rideAccessResult) \n \(skipLineAccessResult)"
        } else {
            testResultLabel.text = "You don't have access to rides."
        }
        
    }
    
    @IBAction func discountSwiper(sender: UIButton) {
        areaAccessStackView.hidden = true
        resetTestResultColor()
        if let foodDiscount = pass?.discountAccess.food, merchandiseDiscount = pass?.discountAccess.merchandise {
            var foodDiscountResult: String = ""
            var merchandiseDiscountResult: String = ""
            
            if foodDiscount != 0 {
                foodDiscountResult = "You get \(foodDiscount)% discount on food."
            } else {
                foodDiscountResult = "You don't have any discount on food."
            }
            
            if merchandiseDiscount != 0 {
                merchandiseDiscountResult = "You get \(merchandiseDiscount)% discount on merchandise."
            } else {
                merchandiseDiscountResult = "You don't have any discount on merchandise."
            }
            
            testResultLabel.text = "\(foodDiscountResult) \n \(merchandiseDiscountResult)"
        }
    }
    
    @IBAction func checkBirthday(sender: UIButton) {
        displayBirthdayMessage(isBirthdayToday)
    }
    
    
    // Helper methods
    
    func updateTestResultColor(accessAllowed: Bool) {
        testResultLabel.textColor = UIColor.whiteColor()
        if accessAllowed {
            testResultBG.backgroundColor = UIColor(red: 88/255.0, green: 149/255.0, blue: 143/255.0, alpha: 1.0)
        } else {
            testResultBG.backgroundColor = UIColor.redColor()
        }
    }
    
    func resetTestResultColor() {
        testResultBG.backgroundColor = UIColor(red: 203/255.0, green: 198/255.0, blue: 207/255.0, alpha: 1.0)
        testResultLabel.textColor = UIColor(red: 121/255.0, green: 117/255.0, blue: 124/255.0, alpha: 1.0)
    }
    
    func displayBirthdayMessage(isBirthdayToday: Bool) {
        if isBirthdayToday {
            birthdayMessageLabel.hidden = false
            birthdayMessageLabel.textColor = UIColor.blackColor()
        } else {
            birthdayMessageLabel.hidden = true
        }
    }
    
    func playSound(accessAllowed: Bool) {
        let path: String?
        if accessAllowed {
            path = NSBundle.mainBundle().pathForResource("AccessGranted", ofType: "wav")
        } else {
            path = NSBundle.mainBundle().pathForResource("AccessDenied", ofType: "wav")
        }
        let url:NSURL = NSURL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(url, &sound)
        AudioServicesPlaySystemSound(sound)
    }
    
}
