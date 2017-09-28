//
//  WorkingClass.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/22/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

@objc protocol updateDelegateObc:class {
    func finished()
    @objc optional
    func updateBlank(number:Int)

}

protocol workingDelegate:class {
    func update(number:Int)
    func finished()
}

class WorkingClass: NSObject {
    var delegate:workingDelegate?
    var objCDelegate:updateDelegateObc?
    
    func countTo(number:Int){
        var total : Int = 0
        for x in 0..<number {
            for _ in x..<number {
                total+=1
            }
            if let workDelegate = delegate {
                workDelegate.update(number: total)
            }
            
            if let workDelegate = objCDelegate {
                if (workDelegate.updateBlank) != nil {
                    workDelegate.updateBlank!(number: total)
                }
            }
        }
        if let workDelegate = delegate {
            workDelegate.finished()
        }
        
        if let workDelegate = objCDelegate {
            workDelegate.finished()
        }
    }
    
}
