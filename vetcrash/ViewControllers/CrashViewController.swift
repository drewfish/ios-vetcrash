//
//  CrashViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/25/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class CrashViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var doses: [DrugDose] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 58.0
        for drug in CRASH_SCHEDULE {
            doses.append(DrugDose(patient: currentPatient!, drug: drug))
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doses.count
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 58.0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var dose = doses[indexPath.row]
        var id = "drugDose2Cell"
        // TODO -- cleanup once I show Jeff
        if currentPatient!.kgs == 120.0 {
            id = "drugDoseCell"
        }
        if currentPatient!.kgs == 121.0 {
            id = "drugDoseACell"
            if dose.doseB != nil {
                id = "drugDoseABCell"
            }
        }
        var cell = tableView.dequeueReusableCellWithIdentifier(id) as DrugDoseCell
        cell.setDrugDose(dose)
        return cell
    }
}
