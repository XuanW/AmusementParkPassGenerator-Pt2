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
    
    var entrantType: Entrant = Guest.classic
    var isBirthdayToday: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Passing generated pass to next screen to display the pass
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "displayPass" {
            if let passController = segue.destinationViewController as? PassController {
                passController.pass = generatePass(entrantType)
                passController.isBirthdayToday = isBirthdayToday
            }
        }
    }
    
    // Unwind segue to bring back main view from pass screen
    @IBAction func backToMainViewController(segue:UIStoryboardSegue) {
        resetAllFirstLevelBtns()
        resetAllSubBtns()
        resetFormFields()
        hideAllSubBtns()
    }
    
    // Display different sub entrant type based on the first level button that's selected
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
        prePopulateData()
    }
    
    
    @IBAction func getEntrantTypeFromUI(sender: UIButton) {
        if guestBtn.selected == true {
            switch sender {
            case subBtn1:
                entrantType = Guest.freeChild
            case subBtn2:
                entrantType = Guest.classic
            case subBtn3:
                entrantType = Guest.senior
            case subBtn4:
                entrantType = Guest.seasonPass
            default:
                entrantType = Guest.vip
            }
        }
        else if employeeBtn.selected == true {
            switch sender {
            case subBtn1:
                entrantType = Employee.hourlyFood
            case subBtn2:
                entrantType = Employee.hourlyRide
            default:
                entrantType = Employee.hourlyMaintenance
            }
        }
        else if managerBtn.selected == true {
            entrantType = Manager.manager
        }
        else if contractorBtn.selected == true {
            switch sender {
            case subBtn1:
                entrantType = Contractor.project1001
            case subBtn2:
                entrantType = Contractor.project1002
            case subBtn3:
                entrantType = Contractor.project1003
            case subBtn4:
                entrantType = Contractor.project2001
            default:
                entrantType = Contractor.project2002
            }
        }
        else if vendorBtn.selected == true {
            switch sender {
            case subBtn1:
                entrantType = Vendor.acme
            case subBtn2:
                entrantType = Vendor.orkin
            case subBtn3:
                entrantType = Vendor.fedex
            default:
                entrantType = Vendor.nwElectrical
            }
        }
    }
    
    @IBAction func populateData(sender: AnyObject) {
        let plugPerson = PersonalInfo(firstName: "David", lastName: "Sawyer", dateOfBirth: "08/04/1982", street: "3928 Mission St", city: "San Francisco", state: "CA", zip: "94102", company: nil, dateOfVisit: nil)
        
        if dateOfBirthTextField.enabled == true {
            dateOfBirthTextField.text = plugPerson.dateOfBirth
        }
        if firstNameTextField.enabled == true {
            firstNameTextField.text = plugPerson.firstName
        }
        if lastNameTextField.enabled == true {
            lastNameTextField.text = plugPerson.lastName
        }
        if streetTextField.enabled == true {
            streetTextField.text = plugPerson.street
        }
        if cityTextField.enabled == true {
            cityTextField.text = plugPerson.city
        }
        if stateTextField.enabled == true {
            stateTextField.text = plugPerson.state
        }
        if zipTextField.enabled == true {
            zipTextField.text = plugPerson.zip
        }
    }
    
    
    @IBAction func generatePassInUI(sender: AnyObject) {
        if let pass = generatePass(entrantType){
            // If a pass is successfully generated, present the next screen to display the pass
            self.performSegueWithIdentifier("displayPass", sender: nil)

            print(pass.title + "\n" + pass.passType + "\n" + pass.rideInfo + "\n" + pass.foodDiscountInfo + "\n" + pass.merchandiseDiscountInfo)
            
        }
    }
    
    func generatePass(entrantType: Entrant) -> Pass? {
        let title: String
        let passType: String
        let rideInfo: String
        let foodDiscountInfo: String
        let merchandiseDiscountInfo: String
        let areaAccess: AreaAccessType
        let rideAccess: RideAccessType
        let discountAccess: DiscountAccessType
        
        do {
            let infoGathered = try gatherRequiredInfo()
            if let firstName = infoGathered.firstName, lastName = infoGathered.lastName {
                if firstName != "" && lastName != "" {
                    title = "\(firstName) \(lastName)"
                } else {
                    title = "Amusement Park Pass"
                }
            } else {
                title = "Amusement Park Pass"
            }
            
            areaAccess = entrantType.getAreaAccessDetail()
            rideAccess = entrantType.getRideAccessDetail()
            discountAccess = entrantType.getDiscountAccessDetail()
            
            foodDiscountInfo = "\(discountAccess.food)% food discount."
            merchandiseDiscountInfo = "\(discountAccess.merchandise)% merchandise discount."
            
            if rideAccess.accessAllRides == true {
                if rideAccess.skipAllRideLines == true {
                    rideInfo = "Unlimited Rides. Priority: VIP."
                } else {
                    rideInfo = "Unlimited Rides. Priority: Regular."
                }
            } else {
                rideInfo = "No access to rides."
            }
            
            switch entrantType {
            case is Guest:
                let guestType = entrantType as! Guest
                switch guestType {
                case .classic:
                    passType = "Classic Guest Pass"
                case .freeChild:
                    passType = "Child Guest Pass"
                case .vip:
                    passType = "VIP Guest Pass"
                case .seasonPass:
                    passType = "Season Guest Pass"
                case .senior:
                    passType = "Senior Guest Pass"
                }
                
            case is Manager:
                passType = "Manager"
                
            case is Employee:
                let employeeType = entrantType as! Employee
                switch employeeType {
                case .hourlyFood:
                    passType = "Hourly Employee - Food Services"
                case .hourlyRide:
                    passType = "Hourly Employee - Ride Services"
                case .hourlyMaintenance:
                    passType = "Hourly Employee - Maintenance"
                }
                
            case is Contractor:
                let contractorType = entrantType as! Contractor
                passType = "Contractor - Project \(contractorType.rawValue)"
                
            default:
                passType = "Vendor - \(infoGathered.company!)"
            }
            
            return Pass(title: title, passType: passType, rideInfo: rideInfo, foodDiscountInfo: foodDiscountInfo, merchandiseDiscountInfo: merchandiseDiscountInfo, areaAccess: areaAccess, rideAccess: rideAccess, discountAccess: discountAccess, personalInfo: infoGathered)
            
        }
        catch RequiredInfoError.MissingRequiredInfo {
            let alertController = UIAlertController(title: "Missing Required Info", message: "Please fill in all required text fields.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
            return nil
        }
        catch RequiredInfoError.DateFormatNotCorrect {
            let alertController = UIAlertController(title: "Date Format Not Correct", message: "Please make sure the date is formatted as MM/DD/YYYY", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
            return nil
        }
        catch RequiredInfoError.ZipCodeFormatNotCorrect {
            let alertController = UIAlertController(title: "Zip Code Format Not Correct", message: "Please make sure the zip code contains only numbers.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
            return nil
        }
        catch RequiredInfoError.ChildAgeRequirementNotMet {
            let alertController = UIAlertController(title: "Age Requirement Not Met", message: "Applicant has to be younger than 5 to get free child pass.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
            return nil
        }
        catch RequiredInfoError.SeniorAgeRequirementNotMet {
            let alertController = UIAlertController(title: "Age Requirement Not Met", message: "Applicant has to be older than 60 to get senior pass.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
            return nil
        }
        catch let error {
            print("Error: \(error)")
            return nil
        }
    }
    
    func gatherRequiredInfo() throws -> PersonalInfo {
        // Gather all required info
        let allTextFields = [dateOfBirthTextField, projectNumberTextField, firstNameTextField, lastNameTextField, companyTextField, dateOfVisitTextField, streetTextField, cityTextField, stateTextField, zipTextField]
        var enabledTextFields: [UITextField] = []
        
        for textField in allTextFields {
            if textField.enabled == true {
                enabledTextFields.append(textField)
            }
        }
        for textField in enabledTextFields {
            guard textField.text != nil && textField.text != "" else {
                throw RequiredInfoError.MissingRequiredInfo
            }
        }
        
        
        if dateOfBirthTextField.enabled == true {
            // Verify date format
            guard let dateOfBirthAsNSDate = convertStringToNSDate(dateOfBirthTextField.text!) else {
                throw RequiredInfoError.DateFormatNotCorrect
            }
            
            // Check birthday
            isBirthdayToday = checkBirthday(dateOfBirthAsNSDate)
            
            // Verify age requirements
            if entrantType is Guest {
                let guestType = entrantType as! Guest
                switch guestType {
                case .freeChild:
                    if !satisfyChildAgeRequirement(dateOfBirthAsNSDate) {
                        throw RequiredInfoError.ChildAgeRequirementNotMet
                    }
                case .senior:
                    if !satisfySeniorAgeRequirement(dateOfBirthAsNSDate) {
                        throw RequiredInfoError.SeniorAgeRequirementNotMet
                    }
                default: break
                }
            }
            
        } else {
            isBirthdayToday = false
        }
        
        if dateOfVisitTextField.enabled == true {
            guard (convertStringToNSDate(dateOfVisitTextField.text!)) != nil else {
                throw RequiredInfoError.DateFormatNotCorrect
            }
        }
        
        // Verify zipcode format
        if zipTextField.enabled == true {
            guard (Int(zipTextField.text!)) != nil else {
                throw RequiredInfoError.ZipCodeFormatNotCorrect
            }
        }
        
        return PersonalInfo(firstName: firstNameTextField.text, lastName: lastNameTextField.text, dateOfBirth: dateOfBirthTextField.text, street: streetTextField.text, city: cityTextField.text, state: stateTextField.text, zip: zipTextField.text, company: companyTextField.text, dateOfVisit: dateOfVisitTextField.text)
    }
    
    // Prepopulate company name, and today's date as Date of Visit for venders, and project number for contractors.
    func prePopulateData() {
        if entrantType is Vendor {
            let currentDate = NSDate()
            dateOfVisitTextField.text = convertNSDateToString(currentDate)
            let vendorType = entrantType as! Vendor
            companyTextField.text = vendorType.rawValue
        } else if entrantType is Contractor {
            let contractorType = entrantType as! Contractor
            projectNumberTextField.text = contractorType.rawValue
        }
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
    
    func hideAllSubBtns() {
        subBtn1.hidden = true
        subBtn2.hidden = true
        subBtn3.hidden = true
        subBtn4.hidden = true
        subBtn5.hidden = true
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
            textField.text = ""
        }
    }
    
    func activateTextField(label label:UILabel, textField: UITextField) {
        let activatedLabelColor = UIColor(red: 95/255.0, green: 93/255.0, blue: 97/255.0, alpha: 1.0)
        label.textColor = activatedLabelColor
        textField.enabled = true
        textField.backgroundColor = UIColor.whiteColor()
    }
    

    
}

