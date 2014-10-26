//
//  Data.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/25/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


let CRASH_SCHEDULE: [Drug] = [
    Drug(
        name: "Epi low",
        doseUnits: "mg",
        concentration: Concentration(name: "1:10,000", doseUnitsPerBottleUnit: 0.1, bottleUnits: "ml"),
        doseA: 0.01,
        doseB: nil
    ),
    Drug(
        name: "Epi high",
        doseUnits: "mg",
        concentration: Concentration(name: "1:1,000", doseUnitsPerBottleUnit: 1, bottleUnits: "ml"),
        doseA: 0.1,
        doseB: nil
    ),
    Drug(
        name: "Atropine",
        doseUnits: "mg",
        concentration: Concentration(name: nil, doseUnitsPerBottleUnit: 0.54, bottleUnits: "ml"),
        doseA: 0.05,
        doseB: nil
    ),
    Drug(
        name: "Vasopressin",
        doseUnits: "U/min",
        concentration: nil,
        doseA: 0.00014,
        doseB: 0.005
    ),
    Drug(
        name: "Lasix",
        doseUnits: "mg",
        concentration: nil,
        doseA: 2.2,
        doseB: 4.4
    ),
    Drug(
        name: "Lidocaine",
        doseUnits: "mg",
        concentration: Concentration(name: "2%", doseUnitsPerBottleUnit: 20, bottleUnits: "ml"),
        doseA: 2,
        doseB: 4
    ),
    Drug(
        name: "Dextrose",
        doseUnits: "ml",
        concentration: nil,
        doseA: 1,
        doseB: nil
    )
]

