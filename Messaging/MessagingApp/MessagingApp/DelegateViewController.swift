//
//  DelegateViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/16/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {

    @IBOutlet weak var nameLabelOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! DelegateViewControllerUpdater).delegate = self
    }

    let workerTester = WorkingClass()
    
    
    @IBAction func workButtonAction(_ sender: Any) {
        workerTester.delegate = self
        workerTester.objCDelegate = self
        
        workerTester.countTo(number: 100000)
    }

}

extension DelegateViewController: updateDelegate {
    func updateName(name: String) {
        nameLabelOutlet.text = name;
    }
}

extension DelegateViewController: workingDelegate, updateDelegateObc {
    func update(number:Int){
        print(number)
    }
    
    func updateBlank(number: Int) {
        print(number)
    }
    
    func finished(){
        print("Done!")
    }
}
