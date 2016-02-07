//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Romaryc on 07/02/16.
//  Copyright © 2016 Romaryc Pelissie. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController {
    
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue : Double? {
        didSet {
            updateCelciusLabel();
        }
    }
    
    var celciusValue : Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelciusLabel() {
        if let value = celciusValue {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celciusLabel.text = "???"
        }
    }
}
