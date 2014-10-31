//
//  ScheduleViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/31/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class ScheduleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.topItem?.title = tabBarItem.title!
    }
}

