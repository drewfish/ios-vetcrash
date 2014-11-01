//
//  ScheduleViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/31/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 58.0
    }

    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.topItem?.title = tabBarItem.title!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CRASH_SCHEDULE.count
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 58.0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var drug = CRASH_SCHEDULE[indexPath.row]
        var cell = tableView.dequeueReusableCellWithIdentifier("drugCell") as DrugCell
        cell.setDrug(drug)
        return cell
    }


}

