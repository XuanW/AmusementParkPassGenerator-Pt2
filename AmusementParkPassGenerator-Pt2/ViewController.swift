//
//  ViewController.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 7/21/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Entrant type selection buttons
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var employeeBtn: UIButton!
    @IBOutlet weak var managerBtn: UIButton!
    @IBOutlet weak var contractorBtn: UIButton!
    @IBOutlet weak var vendorBtn: UIButton!
    @IBOutlet weak var subBtn1: UIButton!
    @IBOutlet weak var subBtn2: UIButton!
    @IBOutlet weak var subBtn3: UIButton!
    @IBOutlet weak var subBtn4: UIButton!
    @IBOutlet weak var subBtn5: UIButton!
    
    // Form fields
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var dateOfVisitTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    // Form field labels
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var projectNumberLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var dateOfVisitLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Plug data for pass generation testing
        
//                let plugClassicGuest = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: nil, street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Guest.classic, person: plugClassicGuest)
//                print("\n")
//        
//                let plugVIPGuest = PersonalInfo(firstName: "Ted", lastName: "Mosby", dateOfBirth: nil, street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Guest.vip, person: plugVIPGuest)
//                print("\n")
//        
//                let plugChildGuest = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: "03/02/2012", street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Guest.freeChild, person: plugChildGuest)
//                print("\n")
//        
//                let plugSeasonGuest = PersonalInfo(firstName: "Mike", lastName: "Davidson", dateOfBirth: nil, street: "3028 Madeup Lane", city: "Palo Alto", state: "CA", zip: "65854", company: nil, dateOfVisit: nil)
//                printPass(Guest.seasonPass, person: plugSeasonGuest)
//                print("\n")
//        
//                let plugSeniorGuest = PersonalInfo(firstName: "Sam", lastName: "Milton", dateOfBirth: "05/02/1956", street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Guest.senior, person: plugSeniorGuest)
//                print("\n")
//        
//                let plugHourlyEmployeeFood = PersonalInfo(firstName: "David", lastName: "Parker", dateOfBirth: nil, street: "412 Whisman Rd", city: "Mountain View", state: "CA", zip: "94023", company: nil, dateOfVisit: nil)
//                printPass(Employee.hourlyFood, person: plugHourlyEmployeeFood)
//                print("\n")
//        
//                let plugHourlyEmployeeRide = PersonalInfo(firstName: "Matt", lastName: "Monohan", dateOfBirth: nil, street: "329 Candy Rd", city: "Los Angeles", state: "CA", zip: "83923", company: nil, dateOfVisit: nil)
//                printPass(Employee.hourlyRide, person: plugHourlyEmployeeRide)
//                print("\n")
//        
//                let plugHourlyEmployeeMaintenance = PersonalInfo(firstName: "Charlie", lastName: "Brown", dateOfBirth: "07-03-1986", street: "920 Peanut Street", city: "Chicago", state: "IL", zip: "37283", company: nil, dateOfVisit: nil)
//                printPass(Employee.hourlyMaintenance, person: plugHourlyEmployeeMaintenance)
//                print("\n")
//        
//                let plugManager = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManager)
//                print("\n")
//        
//                let plugContractor = PersonalInfo(firstName: "Dave", lastName: "O'Reilly", dateOfBirth: nil, street: "302 Fairy Island Road", city: "San Mateo", state: "CA", zip: "94039", company: nil, dateOfVisit: nil)
//                printPass(Contractor.project1001, person: plugContractor)
//                print("\n")
//        
//                let plugVendor = PersonalInfo(firstName: "Lee", lastName: "Wilson", dateOfBirth: "02/03/1974", street: nil, city: nil, state: nil, zip: nil, company: "Super Fedex", dateOfVisit: "07/23/2016")
//                printPass(Vendor.fedex, person: plugVendor)
//                print("\n")
//        
//                let plugChildGuestAgeNotEligible = PersonalInfo(firstName: nil, lastName: nil, dateOfBirth: "03/02/2010", street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Guest.freeChild, person: plugChildGuestAgeNotEligible)
//                print("\n")
//        
//                let plugManagerMissingFirstName = PersonalInfo(firstName: nil, lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingFirstName)
//                print("\n")
//        
//                let plugManagerMissingLastName = PersonalInfo(firstName: "Ian", lastName: nil, dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingLastName)
//                print("\n")
//        
//                let plugManagerMissingStreet = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: nil, city: "San Francisco", state: "CA", zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingStreet)
//                print("\n")
//        
//                let plugManagerMissingCity = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: nil, state: "CA", zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingCity)
//                print("\n")
//        
//                let plugManagerMissingState = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: nil, zip: "93028", company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingState)
//                print("\n")
//        
//                let plugManagerMissingZip = PersonalInfo(firstName: "Ian", lastName: "Chang", dateOfBirth:nil, street: "203 Turtle Road", city: "San Francisco", state: "CA", zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Manager.manager, person: plugManagerMissingZip)
//                print("\n")
//        
//                let plugVendorMissingCompany = PersonalInfo(firstName: "Lee", lastName: "Wilson", dateOfBirth: "02/03/1974", street: nil, city: nil, state: nil, zip: nil, company: nil, dateOfVisit: nil)
//                printPass(Vendor.fedex, person: plugVendorMissingCompany)
//                print("\n")
//        
//                let plugVendorMissingDateOfVisit = PersonalInfo(firstName: "Lee", lastName: "Wilson", dateOfBirth: "02/03/1974", street: nil, city: nil, state: nil, zip: nil, company: "Super Fedex", dateOfVisit: nil)
//                printPass(Vendor.fedex, person: plugVendorMissingDateOfVisit)
//                print("\n")
        
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
        resetAllFirstLevelBtns()
        resetAllSubBtns()
        resetFormFields()
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
            subBtn1.setTitle("Manager", forState: .Normal)
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
    
    @IBAction func setFormFields(sender: UIButton) {
        resetAllSubBtns()
        resetFormFields()
        sender.selected = true
        sender.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        if guestBtn.selected == true {
            switch sender {
            case subBtn1:
                // Child pass, require date of birth
                activateTextField(label: dateOfBirthLabel, textField: dateOfBirthTextField)
            case subBtn3:
                // Senior pass, require first & last name, date of birth
                activateTextField(label: dateOfBirthLabel, textField: dateOfBirthTextField)
                activateTextField(label: firstNameLabel, textField: firstNameTextField)
                activateTextField(label: lastNameLabel, textField: lastNameTextField)
            case subBtn4:
                // Season pass, require first & last name, full address
                activateTextField(label: firstNameLabel, textField: firstNameTextField)
                activateTextField(label: lastNameLabel, textField: lastNameTextField)
                activateTextField(label: streetLabel, textField: streetTextField)
                activateTextField(label: cityLabel, textField: cityTextField)
                activateTextField(label: stateLabel, textField: stateTextField)
                activateTextField(label: zipLabel, textField: zipTextField)
            default:
                // Adult (classic) pass and VIP pass, no info needed
                break
            }
        }
        
        else if vendorBtn.selected == true {
            // Vendor requires date of Birth, first & last name, company, and date of visit info
            activateTextField(label: dateOfBirthLabel, textField: dateOfBirthTextField)
            activateTextField(label: firstNameLabel, textField: firstNameTextField)
            activateTextField(label: lastNameLabel, textField: lastNameTextField)
            activateTextField(label: companyLabel, textField: companyTextField)
            activateTextField(label: dateOfVisitLabel, textField: dateOfVisitTextField)
        }
        
        else {
            // Employee, Manager, or contractor all require first & last Name, full address
            activateTextField(label: firstNameLabel, textField: firstNameTextField)
            activateTextField(label: lastNameLabel, textField: lastNameTextField)
            activateTextField(label: streetLabel, textField: streetTextField)
            activateTextField(label: cityLabel, textField: cityTextField)
            activateTextField(label: stateLabel, textField: stateTextField)
            activateTextField(label: zipLabel, textField: zipTextField)
        }
    }
    

    @IBAction func generatePassInUI(sender: AnyObject) {
        let personalInfo = PersonalInfo(firstName: firstNameTextField.text, lastName: lastNameTextField.text, dateOfBirth: dateOfBirthTextField.text, street: streetTextField.text, city: cityTextField.text, state: stateTextField.text, zip: zipTextField.text, company: companyTextField.text, dateOfVisit: dateOfVisitTextField.text)
        printPass(Guest.freeChild, person: personalInfo)
    }
    
    // Helper methods
    func resetAllFirstLevelBtns() {
        let allBtns = [guestBtn, employeeBtn, managerBtn, contractorBtn, vendorBtn]
        for btn in allBtns {
            btn.selected = false
            btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 22.0)
        }
    }
    
    func resetAllSubBtns() {
        let allBtns = [subBtn1, subBtn2, subBtn3, subBtn4, subBtn5]
        for btn in allBtns {
            btn.selected = false
            btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18.0)
        }
    }
    
    func displayAllSubBtns() {
        subBtn1.hidden = false
        subBtn2.hidden = false
        subBtn3.hidden = false
        subBtn4.hidden = false
        subBtn5.hidden = false
    }
    
    func resetFormFields() {
        let allFormLabels = [dateOfBirthLabel, projectNumberLabel, firstNameLabel, lastNameLabel, companyLabel, dateOfVisitLabel, streetLabel, cityLabel, stateLabel, zipLabel]
        let allTextFields = [dateOfBirthTextField, projectNumberTextField, firstNameTextField, lastNameTextField, companyTextField, dateOfVisitTextField, streetTextField, cityTextField, stateTextField, zipTextField]
        for label in allFormLabels {
            let disabledLabelColor = UIColor(red: 147/255.0, green: 146/255.0, blue: 148/255.0, alpha: 1.0)
            label.textColor = disabledLabelColor
        }
        for textField in allTextFields {
            let disabledTextFieldColor = UIColor(red: 219/255.0, green: 214/255.0, blue: 223/255.0, alpha: 1.0)
            textField.enabled = false
            textField.backgroundColor = disabledTextFieldColor
        }
    }
    
    func activateTextField(label label:UILabel, textField: UITextField) {
        let activatedLabelColor = UIColor(red: 95/255.0, green: 93/255.0, blue: 97/255.0, alpha: 1.0)
        label.textColor = activatedLabelColor
        textField.enabled = true
        textField.backgroundColor = UIColor.whiteColor()
    }
}

