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


class Concentration {
    var name: String?
    var doseUnitsPerBottleUnit: Double?
    var bottleUnits: String?

    init(name: String?, doseUnitsPerBottleUnit: Double?, bottleUnits: String?) {
        self.name = name
        self.doseUnitsPerBottleUnit = doseUnitsPerBottleUnit
        self.bottleUnits = bottleUnits
    }
}


class Drug {
    var name: String
    var doseUnits: String
    var concentration: Concentration?
    var doseA: Double
    var doseB: Double?

    init(name: String, doseUnits: String, concentration: Concentration?, doseA: Double, doseB: Double?) {
        self.name = name
        self.doseUnits = doseUnits
        self.concentration = concentration
        self.doseA = doseA
        self.doseB = doseB
    }
}


class Dose {
    var quantity: Double
    var units: String
    init(quantity: Double, units: String) {
        self.quantity = quantity
        self.units = units
    }
}


// The dosage for a drug for a particular patient.
class DrugDose: Printable {
    var drug: String
    var concentration: String
    var doseA: Dose
    var doseB: Dose?
    var description: String {
        if let b = doseB {
            return "\(drug) (\(concentration)) \(doseA.quantity)\(doseA.units) \(b.quantity)\(b.units)"
        }
        else {
            return "\(drug) (\(concentration)) \(doseA.quantity)\(doseA.units)"
        }
    }

    init(patient: Patient, drug: Drug) {
        self.drug = drug.name
        concentration = ""
        doseA = Dose(quantity: 0.0, units: "")
        doseB = nil
        if let c = drug.concentration {
            if c.name != nil {
                concentration = c.name!
            }
            else if c.doseUnitsPerBottleUnit != nil && c.bottleUnits != nil {
                concentration = "\(c.doseUnitsPerBottleUnit!)\(drug.doseUnits)/\(c.bottleUnits!)"
            }
        }
        doseA = getDose(drug.doseA, forDrug: drug, forKgs: patient.kgs)
        if let b = drug.doseB {
            doseB = getDose(b, forDrug: drug, forKgs: patient.kgs)
        }
    }

    func getDose(dose: Double, forDrug: Drug, forKgs: Double) -> Dose {
        var quantity = dose * forKgs
        var units = forDrug.doseUnits
        if forDrug.concentration?.doseUnitsPerBottleUnit != nil {
            quantity = quantity / forDrug.concentration!.doseUnitsPerBottleUnit!
            units = forDrug.concentration!.bottleUnits!
        }
        return Dose(quantity: quantity, units: units)
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

