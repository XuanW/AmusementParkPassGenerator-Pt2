//
//  SwiperMethod.swift
//  AmusementParkPassGenerator-Pt2
//
//  Created by XuanWang on 7/21/16.
//  Copyright © 2016 XuanWang. All rights reserved.
//

import Foundation
import AudioToolbox

var sound: SystemSoundID = 0

enum RestrictedAreas {
    case kitchen
    case rideControl
    case maintenance
    case office
}

// Area access swiper method, taking parameters of entrant type and personal data
//func areaAcessSwiper(entrantType: Entrant, person: PersonalInfo, toTestArea: RestrictedAreas) -> Bool {
//    if let pass = generatePass(entrantType, person: person) {
//        if let dateOfBirth = pass.personalInfo.dateOfBirth {
//            checkBirthday(dateOfBirth)
//        }
//        
//        switch toTestArea {
//        case .kitchen:
//            if pass.areaAccess.kitchen == true {
//                print("Kitchen area access allowed.")
//            } else {
//                print("Kitchen area access not allowed.")
//            }
//            playSound(pass.areaAccess.kitchen)
//            return pass.areaAccess.kitchen
//        case .rideControl:
//            if pass.areaAccess.rideControl == true {
//                print("Ride control area access allowed.")
//            } else {
//                print("Ride control access not allowed.")
//            }
//            playSound(pass.areaAccess.rideControl)
//            return pass.areaAccess.rideControl
//        case .maintenance:
//            if pass.areaAccess.maintenance == true {
//                print("Maintenance area access allowed.")
//            } else {
//                print("Maintenance area access not allowed.")
//            }
//            playSound(pass.areaAccess.maintenance)
//            return pass.areaAccess.maintenance
//        case .office:
//            if pass.areaAccess.office == true {
//                print("Office area access allowed.")
//            } else {
//                print("Office area access not allowed.")
//            }
//            playSound(pass.areaAccess.office)
//            return pass.areaAccess.office
//        }
//    }
//    return false
//}
//
//// Area access swiper method, taking parameter of an already generated pass
//func areaAcessSwiper(pass: Pass, toTestArea: RestrictedAreas) -> Bool {
//    if let dateOfBirth = pass.personalInfo.dateOfBirth {
//        checkBirthday(dateOfBirth)
//    }
//    
//    switch toTestArea {
//    case .kitchen:
//        if pass.areaAccess.kitchen == true {
//            print("Kitchen area access allowed.")
//        } else {
//            print("Kitchen area access not allowed.")
//        }
//        playSound(pass.areaAccess.kitchen)
//        return pass.areaAccess.kitchen
//    case .rideControl:
//        if pass.areaAccess.rideControl == true {
//            print("Ride control area access allowed.")
//        } else {
//            print("Ride control access not allowed.")
//        }
//        playSound(pass.areaAccess.rideControl)
//        return pass.areaAccess.rideControl
//    case .maintenance:
//        if pass.areaAccess.maintenance == true {
//            print("Maintenance area access allowed.")
//        } else {
//            print("Maintenance area access not allowed.")
//        }
//        playSound(pass.areaAccess.maintenance)
//        return pass.areaAccess.maintenance
//    case .office:
//        if pass.areaAccess.office == true {
//            print("Office area access allowed.")
//        } else {
//            print("Office area access not allowed.")
//        }
//        playSound(pass.areaAccess.office)
//        return pass.areaAccess.office
//    }
//}
//
//// Ride access swiper method, taking parameters of entrant type and personal data
//func rideAccessSwiper(entrantType: Entrant, person: PersonalInfo) {
//    if let pass = generatePass(entrantType, person: person) {
//        if let dateOfBirth = pass.personalInfo.dateOfBirth {
//            checkBirthday(dateOfBirth)
//        }
//        
//        if pass.rideAccess.accessAllRides == true {
//            print("You have access to all rides.")
//        }
//        if pass.rideAccess.skipAllRideLines == true {
//            print("You can skip all ride lines.")
//        }
//    }
//}
//
//// Ride access swiper method, taking parameter of an already generated pass
//func rideAccessSwiper(pass: Pass) {
//    if let dateOfBirth = pass.personalInfo.dateOfBirth {
//        checkBirthday(dateOfBirth)
//    }
//    
//    if pass.rideAccess.accessAllRides == true {
//        print("You have access to all rides.")
//    }
//    if pass.rideAccess.skipAllRideLines == true {
//        print("You can skip all ride lines.")
//    }
//}
//
//
//// Discount access swiper method, taking parameters of entrant type and personal data
//func discountAccessSwiper(entrantType: Entrant, person: PersonalInfo) {
//    if let pass = generatePass(entrantType, person: person) {
//        if let dateOfBirth = pass.personalInfo.dateOfBirth {
//            checkBirthday(dateOfBirth)
//        }
//        
//        let foodDiscount = pass.discountAccess.food
//        let merchandiseDiscount = pass.discountAccess.merchandise
//        
//        if foodDiscount != 0 {
//            print("You get \(foodDiscount)% discount on food.")
//        } else {
//            print("You don't have any discount on food.")
//        }
//        
//        if merchandiseDiscount != 0 {
//            print("You get \(merchandiseDiscount)% discount on merchandise.")
//        } else {
//            print("You don't have any discount on merchandise.")
//        }
//    }
//}
//
//// Discount access swiper method, taking parameter of an already generated pass
//func discountAccessSwiper(pass: Pass) {
//    if let dateOfBirth = pass.personalInfo.dateOfBirth {
//        checkBirthday(dateOfBirth)
//    }
//    
//    let foodDiscount = pass.discountAccess.food
//    let merchandiseDiscount = pass.discountAccess.merchandise
//    
//    if foodDiscount != 0 {
//        print("You get \(foodDiscount)% discount on food.")
//    } else {
//        print("You don't have any discount on food.")
//    }
//    
//    if merchandiseDiscount != 0 {
//        print("You get \(merchandiseDiscount)% discount on merchandise.")
//    } else {
//        print("You don't have any discount on merchandise.")
//    }
//    
//}
//
//
//
//func playSound(accessAllowed: Bool) {
//    let path: String?
//    if accessAllowed {
//        path = NSBundle.mainBundle().pathForResource("AccessGranted", ofType: "wav")
//    } else {
//        path = NSBundle.mainBundle().pathForResource("AccessDenied", ofType: "wav")
//    }
//    let url: NSURL = NSURL(fileURLWithPath: path!)
//    AudioServicesCreateSystemSoundID(url, &sound)
//    AudioServicesPlaySystemSound(sound)
//}
//
//


