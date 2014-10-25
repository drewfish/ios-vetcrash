//
//  PatientModel.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


func weightToKgs(weight: Double, units: String) -> Double {
    switch units {
    case "lbs":
        return weight * 0.453592
    case "kgs":
        return weight
    default:
        return 0.0
    }
}


func kgsToWeight(kgs: Double, units: String) -> Double {
    switch units {
    case "lbs":
        return kgs / 0.453592
    case "kgs":
        return kgs
    default:
        return 0.0
    }
}


//enum Species: String {
//    case Cat = "Cat"
//    case Dog = "Dog"
//}


class Patient {
    var kgs: Double

    init(kgs: Double) {
        self.kgs = kgs
    }
}


class Settings {

    var units: String {
        get {
            var val = store.objectForKey("units") as NSString?
            return val ?? "kgs"
        }
        set {
            var v = NSString(string: newValue)
            store.setObject(v, forKey: "units")
            store.synchronize()
        }
    }

    private var store = NSUserDefaults.standardUserDefaults()
}

