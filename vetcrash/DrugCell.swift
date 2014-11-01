//
//  DrugCell.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/31/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class DrugCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var concentrationLabel: UILabel!
    @IBOutlet weak var doseAQuantityLabel: UILabel!
    @IBOutlet weak var doseAUnitsLabel: UILabel!

    func setDrug(drug: Drug) {
        nameLabel.text = drug.name

        var conc = ""
        if let c = drug.concentration {
            if c.name != nil {
                conc = c.name!
            }
            if let dose = c.doseUnitsPerBottleUnit {
                let d = DOSE_FORMATTER.stringFromNumber(dose)! + " \(drug.doseUnits)/\(c.bottleUnits!)"
                if conc == "" {
                    conc = d
                }
                else {
                    conc += " (\(d))"
                }
            }
        }
        concentrationLabel.text = conc
        doseAUnitsLabel.text = "\(drug.doseUnits)/kg"

        var doseA = DOSE_FORMATTER.stringFromNumber(drug.doseA)!
        if let b = drug.doseB {
            doseA = doseA + " - " + DOSE_FORMATTER.stringFromNumber(b)!
        }
        doseAQuantityLabel.text = doseA
    }

}


