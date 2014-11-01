//
//  DrugDoseCell.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/25/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class DrugDoseCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var concentrationLabel: UILabel!
    @IBOutlet weak var doseAQuantityLabel: UILabel!
    @IBOutlet weak var doseAUnitsLabel: UILabel!

    func setDrugDose(dose: DrugDose) {
        nameLabel.text = dose.drug
        concentrationLabel.text = dose.concentration
        doseAUnitsLabel.text = dose.doseA.units

        var doseA = DOSE_FORMATTER.stringFromNumber(dose.doseA.quantity)!
        if let b = dose.doseB {
            doseA = doseA + " - " + DOSE_FORMATTER.stringFromNumber(dose.doseB!.quantity)!
        }
        doseAQuantityLabel.text = doseA
    }
}

