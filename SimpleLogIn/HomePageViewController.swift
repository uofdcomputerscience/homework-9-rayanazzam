//
//  HomePageViewController.swift
//  SimpleLogIn
//
//  Created by Rayan Ahmed on 12/9/19.
//  Copyright © 2019 Rayan Ahmed. All rights reserved.
//

import UIKit
import Parse

class HomePageViewController: UIViewController {
        
    @IBOutlet weak var lblHome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let username = PFUser.current()!.username!
        lblHome.text = "Hey there, \(username)!"
    }
}

