//
//  PassController.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 8/3/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    @IBOutlet weak var passTitleLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var rideInfoLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchandiseDiscountLabel: UILabel!
    
    var pass:Pass? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayPass()
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

}
