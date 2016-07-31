//
//  ViewController.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 7/21/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var employeeBtn: UIButton!
    @IBOutlet weak var managerBtn: UIButton!
    @IBOutlet weak var contractorBtn: UIButton!
    @IBOutlet weak var vendorBtn: UIButton!
    @IBOutlet weak var subTypeStackView: UIStackView!
    @IBOutlet weak var subBtn1: UIButton!
    @IBOutlet weak var subBtn2: UIButton!
    @IBOutlet weak var subBtn3: UIButton!
    @IBOutlet weak var subBtn4: UIButton!
    @IBOutlet weak var subBtn5: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Plug data for pass generation testing
        
                let plugClassicGuest = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: nil, street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Guest.classic, person: plugClassicGuest)
                print("\n")
        
                let plugVIPGuest = PersonalInfo(firstName: "Ted", lastName: "Mosby", dateOfBirth: nil, street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Guest.vip, person: plugVIPGuest)
                print("\n")
        
                let plugChildGuest = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: "03/02/2012", street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Guest.freeChild, person: plugChildGuest)
                print("\n")
        
                let plugSeasonGuest = PersonalInfo(firstName: "Mike", lastName: "Davidson", dateOfBirth: nil, street: "3028 Madeup Lane", city: "Palo Alto", state: "CA", zip: "65854", company: nil)
                printPass(Guest.seasonPass, person: plugSeasonGuest)
                print("\n")
        
                let plugSeniorGuest = PersonalInfo(firstName: "Sam", lastName: "Milton", dateOfBirth: "05/02/1956", street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Guest.senior, person: plugSeniorGuest)
                print("\n")
        
                let plugHourlyEmployeeFood = PersonalInfo(firstName: "David", lastName: "Parker", dateOfBirth: nil, street: "412 Whisman Rd", city: "Mountain View", state: "CA", zip: "94023", company: nil)
                printPass(Employee.hourlyFood, person: plugHourlyEmployeeFood)
                print("\n")
        
                let plugHourlyEmployeeRide = PersonalInfo(firstName: "Matt", lastName: "Monohan", dateOfBirth: nil, street: "329 Candy Rd", city: "Los Angeles", state: "CA", zip: "83923", company: nil)
                printPass(Employee.hourlyRide, person: plugHourlyEmployeeRide)
                print("\n")
        
                let plugHourlyEmployeeMaintenance = PersonalInfo(firstName: "Charlie", lastName: "Brown", dateOfBirth: "07-03-1986", street: "920 Peanut Street", city: "Chicago", state: "IL", zip: "37283", company: nil)
                printPass(Employee.hourlyMaintenance, person: plugHourlyEmployeeMaintenance)
                print("\n")
        
                let plugManager = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManager)
                print("\n")
        
                let plugContractor = PersonalInfo(firstName: "Dave", lastName: "O'Reilly", dateOfBirth: nil, street: "302 Fairy Island Road", city: "San Mateo", state: "CA", zip: "94039", company: nil)
                printPass(Contractor.project1001, person: plugContractor)
                print("\n")
        
                let plugVendor = PersonalInfo(firstName: "Lee", lastName: "Wilson", dateOfBirth: "02/03/1974", street: nil, city: nil, state: nil, zip: nil, company: "Super Fedex")
                printPass(Vendor.fedex, person: plugVendor)
                print("\n")
        
                let plugChildGuestAgeNotEligible = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: "03/02/2010", street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Guest.freeChild, person: plugChildGuestAgeNotEligible)
                print("\n")
        
                let plugManagerMissingFirstName = PersonalInfo(firstName: nil, lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManagerMissingFirstName)
                print("\n")
        
                let plugManagerMissingLastName = PersonalInfo(firstName: "Ian", lastName: nil, dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManagerMissingLastName)
                print("\n")
        
                let plugManagerMissingStreet = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: nil, city: "San Francisco", state: "CA", zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManagerMissingStreet)
                print("\n")
        
                let plugManagerMissingCity = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: nil, state: "CA", zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManagerMissingCity)
                print("\n")
        
                let plugManagerMissingState = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: nil, zip: "93028", company: nil)
                printPass(Manager.manager, person: plugManagerMissingState)
                print("\n")
        
                let plugManagerMissingZip = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: nil, company: nil)
                printPass(Manager.manager, person: plugManagerMissingZip)
                print("\n")
        
                let plugVendorMissingCompany = PersonalInfo(firstName: "Lee", lastName: "Wilson", dateOfBirth: "02/03/1974", street: nil, city: nil, state: nil, zip: nil, company: nil)
                printPass(Vendor.fedex, person: plugVendorMissingCompany)
                print("\n")
        
        // Plug data for swiper methods testing
        
//        let plugPersonForSwiper = PersonalInfo(firstName: "Charlie", lastName: "Brown", dateOfBirth: "07-04-1986", street: "920 Peanut Street", city: "Chicago", state: "IL", zip: "37283", company: nil)
//        printPass(Employee.hourlyMaintenance, person: plugPersonForSwiper)
//        print("\n")
//        if let pass = generatePass(Employee.hourlyMaintenance, person: plugPersonForSwiper) {
//            print("Swiper methods tests:")
//            areaAcessSwiper(pass, toTestArea: RestrictedAreas.office)
//            print("\n")
//            rideAccessSwiper(pass)
//            print("\n")
//            discountAccessSwiper(pass)
//        }
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func setSubBtns(sender: UIButton) {
        resetAllBtns()
        displayAllSubBtns()
        sender.selected = true
        sender.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        switch sender {
        case guestBtn:
            subBtn1.setTitle("Child", forState: .Normal)
            subBtn2.setTitle("Adult", forState: .Normal)
            subBtn3.setTitle("Senior", forState: .Normal)
            subBtn4.setTitle("Season", forState: .Normal)
            subBtn5.setTitle("VIP", forState: .Normal)
        case employeeBtn:
            subBtn1.setTitle("Food Services", forState: .Normal)
            subBtn2.setTitle("Ride Services", forState: .Normal)
            subBtn3.setTitle("Maintenance", forState: .Normal)
            subBtn4.hidden = true
            subBtn5.hidden = true
        case managerBtn:
            subBtn2.hidden = true
            subBtn3.hidden = true
            subBtn4.hidden = true
            subBtn5.hidden = true
        case contractorBtn:
            subBtn1.setTitle("Project 1001", forState: .Normal)
            subBtn2.setTitle("Project 1002", forState: .Normal)
            subBtn3.setTitle("Project 1003", forState: .Normal)
            subBtn4.setTitle("Project 2001", forState: .Normal)
            subBtn5.setTitle("Project 2002", forState: .Normal)
        default:
            subBtn1.setTitle("Acme", forState: .Normal)
            subBtn2.setTitle("Orkin", forState: .Normal)
            subBtn3.setTitle("Fedex", forState: .Normal)
            subBtn4.setTitle("NW Electrical", forState: .Normal)
            subBtn5.hidden = true
        }
    }
    
    func resetAllBtns() {
        let allBtns = [guestBtn, employeeBtn, managerBtn, contractorBtn, vendorBtn]
        for btn in allBtns {
            btn.selected = false
            btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 22.0)
        }
    }
    
    func displayAllSubBtns() {
        subBtn1.hidden = false
        subBtn2.hidden = false
        subBtn3.hidden = false
        subBtn4.hidden = false
        subBtn5.hidden = false
    }

}

