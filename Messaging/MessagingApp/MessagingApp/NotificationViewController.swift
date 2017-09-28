//
//  NotificationViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/18/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNotificationButtonAction(_ sender: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(NotificationViewController.updateName), name: NSNotification.Name(rawValue: "updateNameNotification"), object: nil)
        
    }
    
    func updateName(note:Notification){
        nameLabelOutlet.text = note.userInfo!["name"] as? String
    }
    
    @IBAction func removeNotificationButtonAction(_ sender: Any) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "updateNameNotification"), object: nil)
    }

    

}
