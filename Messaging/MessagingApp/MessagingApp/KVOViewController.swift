//
//  KVOViewController.swift
//  MessagingApp
//
//  Created by Andrew Riznyk on 8/22/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

import UIKit

class KVOViewController: UIViewController {
    
    var sliderValues = SliderValues()
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    static var PrivateKVOContext: UnsafeMutableRawPointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValues = SliderValues()
        colorView.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        
        KVOViewController.PrivateKVOContext = UnsafeMutableRawPointer.init(bitPattern: KVOViewController.hash())
        
        sliderValues.addObserver(self, forKeyPath: #keyPath(SliderValues.redValue), options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old], context: KVOViewController.PrivateKVOContext)
        sliderValues.addObserver(self, forKeyPath: "greenValue", options: [NSKeyValueObservingOptions.new], context: KVOViewController.PrivateKVOContext)
        sliderValues.addObserver(self, forKeyPath: "blueValue", options: [NSKeyValueObservingOptions.new], context: KVOViewController.PrivateKVOContext)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redSliderChangeAction(_ sender: Any) {
        sliderValues.redValue = NSNumber(value:redSlider.value)
    }

    @IBAction func greenSliderChangAction(_ sender: Any) {
        sliderValues.greenValue = greenSlider.value
    }

    @IBAction func blueSliderChangeActon(_ sender: Any) {
        sliderValues.blueValue = NSNumber(value:blueSlider.value)
    }
}

extension KVOViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keypath = keyPath, context == KVOViewController.PrivateKVOContext  {
            let color = CIColor(color: colorView.backgroundColor!)
            var newColor:UIColor!
            let colorNumber = change?[.newKey]! as! Float / 255.0
            switch(keypath) {
            case "redValue" :
                newColor = UIColor.init(colorLiteralRed: colorNumber, green: Float(color.green), blue: Float(color.blue), alpha: 1)
                break
            case "greenValue" :
                newColor = UIColor.init(colorLiteralRed: Float(color.red), green: colorNumber, blue: Float(color.blue), alpha: 1)
                break
            case "blueValue" :
                newColor = UIColor.init(colorLiteralRed: Float(color.red), green: Float(color.green), blue: colorNumber, alpha: 1)
                break
            default:
                break
            }
            colorView.backgroundColor = newColor
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    
    }
}
