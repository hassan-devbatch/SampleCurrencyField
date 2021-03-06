//
//  CurrencyTextField.swift
//  SmapleCurrencyField
//
//  Created by DB MAC MINI on 5/16/18.
//  Copyright © 2018 DB MAC MINI. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField, UITextFieldDelegate {
    
    /**
     Set this variable accordint to your desired currency symbol
     */
    var currencySymbol : String! = "$"
    
    // MARK: - init functions
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initTextField()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTextField()
    }
    /**
     This method will initialize the UITextField
     */
    func initTextField(){
        
        self.text = currencySymbol + " 0"
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("text field changed")
        
        if  let value : Int = text!.integer {
            textField.text = "\(currencySymbol!) \(String(value))"
        }
        
    }
    
    override func shouldChangeText(in range: UITextRange, replacementText text: String) -> Bool {
        return true
    }
    
}



extension String {
    var numbers: String { return components(separatedBy: Numbers.characterSet.inverted).joined() }
    var integer: Int { return Int(numbers) ?? 0 }
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
struct Numbers { static let characterSet = CharacterSet(charactersIn: "0123456789") }

