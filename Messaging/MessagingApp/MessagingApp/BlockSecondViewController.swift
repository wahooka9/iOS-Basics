//
//  BlockSecondViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/18/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

typealias nameClosure = (_ name:String)->Void

class BlockSecondViewController: UIViewController {

    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    
    var block:nameClosure!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closureButtonAction(_ sender: Any) {
        block(nameTextFieldOutlet.text!)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }


}
