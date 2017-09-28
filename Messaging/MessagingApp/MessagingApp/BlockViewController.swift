//
//  BlockViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/18/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! BlockSecondViewController).block = { [unowned self] (name:String) in
            self.nameLabelOutlet.text = name;
        }
    }

}
