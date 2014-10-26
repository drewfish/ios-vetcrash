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
    @IBOutlet weak var doseBQuantityLabel: UILabel!
    @IBOutlet weak var doseBUnitsLabel: UILabel!

    func setDrugDose(dose: DrugDose) {
        nameLabel.text = dose.drug
        concentrationLabel.text = dose.concentration
        doseAQuantityLabel.text = DOSE_FORMATTER.stringFromNumber(dose.doseA.quantity)
        doseAUnitsLabel.text = dose.doseA.units
        if doseBQuantityLabel != nil {
            doseBQuantityLabel.text = DOSE_FORMATTER.stringFromNumber(dose.doseB!.quantity)
            doseBUnitsLabel.text = dose.doseB!.units
        }
    }
}

