//
//  AboutViewController.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/31/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib(nibName: "LaunchScreen", bundle: nil)
        var objs = nib.instantiateWithOwner(self, options: nil) as [UIView]
        var launchScreen = objs[0]
        launchScreen.frame = view.frame
        view.addSubview(launchScreen)
    }

    override func viewDidAppear(animated: Bool) {
        navigationController?.navigationBar.topItem?.title = tabBarItem.title!
    }
}

