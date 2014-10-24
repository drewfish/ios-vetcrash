//
//  PatientModel.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


enum Species: Int {
    case Cat = 0
    case Dog = 1
}


class Patient {
    var species: Species
    var kgs: Double

    init(species: Species, kgs: Double) {
        self.species = species
        self.kgs = kgs
    }
}

