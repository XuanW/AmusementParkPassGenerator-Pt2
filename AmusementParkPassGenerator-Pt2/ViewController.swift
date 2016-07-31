//
//  ViewController.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 7/21/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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


}

