//
//  ViewController.swift
//  PANumberKeyboard
//
//  Created by Alexey Popkov on 2/19/16.
//  Copyright © 2016 Alexey Popkov. All rights reserved.
//

//
//  ViewController.swift
//  PACustomKeyboard
//
//  Created by Alexey Popkov on 2/12/16.
//  Copyright © 2016 Alexey Popkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var decimalTextField: UITextField!
    
    var keyboardVC:PANumberKeyboardViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureKeyboard()
    }
    
    func configureKeyboard()
    {
        self.keyboardVC = PANumberKeyboardViewController.createDecimalKeyboard()
        self.keyboardVC.allowDecimalPoint = true
        self.keyboardVC.decimalPointAsComma = true
        //        self.keyboardVC.setSelectedTextButtonBackgroundColor(UIColor.greenColor())
        //        self.keyboardVC.setSelectedReturnButtonBackgroundColor(UIColor.whiteColor())
        //        self.keyboardVC.setSelectedBackspaceButtonBackgroundColor(UIColor.blackColor())
        
        self.keyboardVC.returnButton.setTitle("Next", forState: .Normal)
        
        /*for button in self.keyboardVC.allButtons
        {
        let layer = button.layer
        layer.masksToBounds = true
        layer.cornerRadius = 2
        }*/
        
        self.keyboardVC.returnAction = { (Void) -> Void in
            // TODO: handle return button pressed
        }
        
        self.keyboardVC.backspaceAction = { (Void) -> Void in
            // TODO: handle backspace button pressed
        }
        
        self.keyboardVC.newTextAction = { (text:String) -> Void in
            // TODO: handle insert new text
        }
        
        decimalTextField.inputView = self.keyboardVC.keyboardView
        decimalTextField.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        print(range)
        return true;
    }
}



