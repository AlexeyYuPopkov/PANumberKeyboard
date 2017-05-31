//
//  PADecimalKeyboardButton.swift
//  PACustomKeyboard
//
//  Created by Alexey Popkov on 2/18/16.
//  Copyright © 2016 Alexey Popkov. All rights reserved.
//

import UIKit

enum ButtonActionType:Int
{
    case backspace
    case returnButton
}

protocol PADecimalKeyboardButtonProtocol
{
    func theButtonText() -> String?
    func theButtonActionType() -> ButtonActionType?
}

class PADecimalKeyboardButton: UIButton, PADecimalKeyboardButtonProtocol
{
    func theButtonText() -> String? {
        return nil
    }
    
    func theButtonActionType() -> ButtonActionType? {
        return nil
    }
}

class PADecimalKeyboardTextButton: PADecimalKeyboardButton
{
}

class PADecimalKeyboardZeroButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "0"
    }
}

class PADecimalKeyboardOneButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "1"
    }
}

class PADecimalKeyboardTwoButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "2"
    }
}

class PADecimalKeyboardThreeButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "3"
    }
}

class PADecimalKeyboardFourButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "4"
    }
}

class PADecimalKeyboardFiveButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "5"
    }
}

class PADecimalKeyboardSixButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "6"
    }
}

class PADecimalKeyboardSevenButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "7"
    }
}

class PADecimalKeyboardEightButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "8"
    }
}

class PADecimalKeyboardNineButton: PADecimalKeyboardTextButton
{
    override func theButtonText() -> String? {
        return "9"
    }
}

class PADecimalKeyboardDotButton: PADecimalKeyboardTextButton
{
    fileprivate var privateDecimalPointAsComma = false
    
    fileprivate var privateDotText = "."
    
    var decimalPointAsComma:Bool {
        get {
            return privateDecimalPointAsComma
        }
        set(newValue) {
            privateDecimalPointAsComma = newValue
            
            if decimalPointAsComma == true {
                privateDotText = ","
                configureButtonTitle(privateDotText)
            } else {
                privateDotText = "."
                configureButtonTitle(privateDotText)
            }
        }
    }
    
    fileprivate func configureButtonTitle(_ title:String)
    {
        self.setTitle(title, for: .selected)
        self.setTitle(title, for: .highlighted)
        self.setTitle(title, for: UIControlState())
    }
    
    override func theButtonText() -> String? {
        return privateDotText
    }
}

class PADecimalKeyboardBackspaceButton: PADecimalKeyboardButton
{
    override func theButtonActionType() -> ButtonActionType? {
        return ButtonActionType.backspace
    }
}

class PADecimalKeyboardReturnButtonButton: PADecimalKeyboardButton
{
    override func theButtonActionType() -> ButtonActionType? {
        return ButtonActionType.returnButton
    }
}
