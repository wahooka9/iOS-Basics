//
//  SliderValues.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/22/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import Foundation

class SliderValues: NSObject {
    
    dynamic var redValue : NSNumber {
        didSet {
           // print(oldValue)
        }
    }
    dynamic var blueValue : NSNumber
    dynamic var greenValue : Float
    
    override init() {
        redValue = NSNumber(value:0)
        blueValue = NSNumber(value:0)
        greenValue = 0 // NSNumber(value:0)
        
    }
    
    override func didChangeValue(forKey key: String) {
        super.didChangeValue(forKey: key)
// This is not needed -  i like to use it to illustrate whats up
    }

}
