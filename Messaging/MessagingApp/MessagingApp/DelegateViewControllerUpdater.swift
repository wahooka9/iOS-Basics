//
//  DelegateViewControllerUpdater.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/17/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit


protocol updateDelegate: class {
    func updateName(name:String)
}

class DelegateViewControllerUpdater: UIViewController {
    
    weak var delegate:updateDelegate?;

    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }

    @IBAction func updateButtonAction(_ sender: Any) {
        delegate?.updateName(name: nameTextFieldOutlet.text!)
    }

}
