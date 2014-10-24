//
//  PatientViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class PatientViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var weightControl: UITextField!
    @IBOutlet weak var unitControl: UISegmentedControl!
    @IBOutlet weak var speciesControl: UISegmentedControl!
    @IBOutlet weak var crashButton: UIButton!
    var weight = 0.0
    var species: Species?
    var formatter: NSNumberFormatter = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        unitControl.customStyle()
        speciesControl.customStyle()
        formatter.maximumFractionDigits = 2
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        readSettings()
        if currentPatient != nil {
            readPatient(currentPatient!)
        }
        weightControl.delegate = self
        weightControl.becomeFirstResponder()
    }

    func readSettings() {
        unitControl.selectFromString(settings.units)
    }

    func readPatient(patient: Patient) {
        speciesControl.selectFromString(patient.species.toRaw())
        weight = kgsToWeight(patient.kgs, unitControl.text)
        weightControl.text = formatter.stringFromNumber(weight)
    }

    @IBAction func onUnits() {
        var newUnits = unitControl.text
        var oldUnits = {
            () -> String in
            switch newUnits {
            case "kgs": return "lbs"
            default: return "kgs"
            }
        }()
        settings.units = newUnits
        var kgs = weightToKgs(weight, oldUnits)
        weight = kgsToWeight(kgs, newUnits)
        weightControl.text = formatter.stringFromNumber(weight)
    }

    @IBAction func onSpecies() {
        species = Species.fromRaw(speciesControl.text)
        checkControls()
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // http://stackoverflow.com/questions/25621496/shouldchangecharactersinrange-called-before-textfield-changes-text-swift
        var t = textField.text as NSString
        t = t.stringByReplacingCharactersInRange(range, withString: string)
        weight = t.doubleValue ?? 0.0
        checkControls()
        return true
    }

    func checkControls() {
        crashButton.enabled = (weight > 0.0) && (species != nil)
    }

    @IBAction func onCrash() {
        var kgs = weightToKgs(weight, unitControl.text)
        currentPatient = Patient(species: species!, kgs: kgs)
        performSegueWithIdentifier("crashSegue", sender: self)
    }
}

