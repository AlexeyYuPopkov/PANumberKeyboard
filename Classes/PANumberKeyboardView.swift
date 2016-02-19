//
//  PAKeyboardView.swift
//  PACustomKeyboard
//
//  Created by Alexey Popkov on 2/12/16.
//  Copyright © 2016 Alexey Popkov. All rights reserved.
//

import UIKit
//import PADecimalKeyboardButton

protocol PANumberKeyboardViewDelegate
{
    func keyboardButtonPressed(text:String?, actionType:ButtonActionType?, keyboard:PANumberKeyboardView)
}

class PANumberKeyboardView: UIView
{
    var delegate:PANumberKeyboardViewDelegate?
    
//    private var selectedButtonBackgroundImage:UIImage?
    
    private var privateSelectedTextButtonBackgroundImage:UIImage?
    private var privateSelectedBackspaceButtonBackgroundImage:UIImage?
    private var privateSelectedReturnButtonBackgroundImage:UIImage?
}

// MARK: - Setters
extension PANumberKeyboardView
{
    func setSelectedTextButtonBackgroundImage(image:UIImage) {
        privateSelectedTextButtonBackgroundImage = image
        configureView()
    }
    
    func setSelectedBackspaceButtonBackgroundImage(image:UIImage) {
        privateSelectedBackspaceButtonBackgroundImage = image
//        configureView()
    }
    
    func setSelectedReturnButtonBackgroundImage(image:UIImage) {
        privateSelectedReturnButtonBackgroundImage = image
//        configureView()
    }
}

// MARK: - Private
extension PANumberKeyboardView
{
    private func configureView()
    {
        for theView in self.subviews
        {
            if theView.isKindOfClass(PADecimalKeyboardTextButton)
            {
                let button = theView as! PADecimalKeyboardTextButton
                
                if let theSelectedButtonBackgroundImage = privateSelectedTextButtonBackgroundImage
                {
                    setSelectedButtonImage(button, image:theSelectedButtonBackgroundImage)
                }
            }
        }
    }
    
    private func setSelectedButtonImage(button:UIButton, image:UIImage)
    {
        button.setBackgroundImage(image, forState: .Selected)
        button.setBackgroundImage(image, forState: .Highlighted)
    }
    

}
