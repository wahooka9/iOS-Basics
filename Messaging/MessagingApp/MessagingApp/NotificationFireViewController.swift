//
//  NotificationFireViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/18/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

class NotificationFireViewController: UIViewController {

    @IBOutlet weak var notificationNameTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notificationButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateNameNotification"), object: nil, userInfo: ["name":notificationNameTextFieldOutlet.text!])
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }

}
