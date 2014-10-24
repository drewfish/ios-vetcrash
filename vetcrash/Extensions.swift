//
//  Extensions.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


extension UISegmentedControl {
    var text: String {
        return titleForSegmentAtIndex(selectedSegmentIndex) ?? ""
    }

    func selectFromString(string: String) {
        for i in 0...numberOfSegments {
            var t = titleForSegmentAtIndex(i)
            if t == string {
                selectedSegmentIndex = i
                break
            }
        }
    }

    func customStyle() {
        var tint = self.tintColor
        self.tintColor = tint.colorWithAlphaComponent(0.2)
        var atts: [NSObject: AnyObject] = [:]
        atts[NSForegroundColorAttributeName] = tint
        self.setTitleTextAttributes(atts, forState: .Normal)
    }
}


extension UIViewController {
    var settings: Settings {
        return (UIApplication.sharedApplication().delegate as AppDelegate).settings
    }

    var currentPatient: Patient? {
        get {
            return (UIApplication.sharedApplication().delegate as AppDelegate).currentPatient
        }
        set {
            (UIApplication.sharedApplication().delegate as AppDelegate).currentPatient = newValue
        }
    }
}

