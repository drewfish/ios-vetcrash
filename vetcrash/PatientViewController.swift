//
//  PatientViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


let POUNDS_TO_KILOGRAMS = 0.453592


class PatientViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var weightControl: UITextField!
    @IBOutlet weak var unitControl: UISegmentedControl!
    @IBOutlet weak var speciesControl: UISegmentedControl!
    @IBOutlet weak var crashButton: UIButton!
    var weight = 0.0
    var species: Species?

    override func viewDidLoad() {
        super.viewDidLoad()
        unitControl.customStyle()
        speciesControl.customStyle()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        weightControl.becomeFirstResponder()
        weightControl.delegate = self
    }

    @IBAction func onSpecies() {
        species = Species.fromRaw(speciesControl.selectedSegmentIndex)
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
        var units = 0
        var kgs = 0.0
        if 0 == unitControl.selectedSegmentIndex {
            kgs = weight * POUNDS_TO_KILOGRAMS
        }
        else {
            kgs = weight
        }
        currentPatient = Patient(species: species!, kgs: kgs)
    }
    

//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//    }

}

