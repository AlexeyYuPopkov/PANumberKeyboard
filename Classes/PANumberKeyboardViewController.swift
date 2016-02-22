//
//  KeyboardViewController.swift
//  DecimalKeyboard
//
//  Created by Alexey Popkov on 2/12/16.
//  Copyright © 2016 Alexey Popkov. All rights reserved.
//

import UIKit

@objc public class PANumberKeyboardViewController: UIInputViewController
{
    @IBOutlet weak var keyboardView: UIView!
    
    private var privateAllowDecimalPoint = false
    private var privateDecimalPointAsComma = false
    
    private var selectedTextButtonBackgroundImage:UIImage?
    private var selectedBackspaceButtonBackgroundImage:UIImage?
    private var selectedReturnButtonBackgroundImage:UIImage?
    
    public var backspaceAction:((Void) -> Void)?
    public var newTextAction:((text:String) -> Void)?
    public var returnAction:((Void) -> Void)?
    
    @IBOutlet weak var backspaceButton: PADecimalKeyboardBackspaceButton!
    @IBOutlet weak var returnButton: PADecimalKeyboardReturnButtonButton!
    
    @IBOutlet weak private var dotButton: PADecimalKeyboardDotButton!
    @IBOutlet weak private var zeroBigButton: PADecimalKeyboardZeroButton!
    @IBOutlet weak private var zeroSmallButton: PADecimalKeyboardZeroButton!
    
    class public func createDecimalKeyboard() -> PANumberKeyboardViewController
    {
        // object_getClass(PANumberKeyboardViewController)
        let nib = UINib(nibName: "PANumberKeyboardViewController", bundle: NSBundle(forClass: PANumberKeyboardViewController.self))
        let objects = nib.instantiateWithOwner(self, options: nil)
        let vc = objects[0] as! PANumberKeyboardViewController;
        return vc
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        configureKeyboard()
    }
    
    private func configureKeyboard()
    {
        configureSelectedButtonBackgroundImages()
        configureDecimalPointButton()
    }
    
    override public func updateViewConstraints()
    {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }

    override public func textWillChange(textInput: UITextInput?)
    {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override public func textDidChange(textInput: UITextInput?)
    {
        // The app has just changed the document's contents, the document context has been updated.
    }
}

extension PANumberKeyboardViewController
{
    @IBAction func buttonPressedAction(button: PADecimalKeyboardButton)
    {
        processActionType(button.theButtonActionType())
        processNewText(button.theButtonText())
    }
}

// MARK: - Configuration Setters
extension PANumberKeyboardViewController
{
    public var allowDecimalPoint:Bool {
        get {
            return privateAllowDecimalPoint
        }
        set(newValue) {
            privateAllowDecimalPoint = newValue
            configureDecimalPointButton()
        }
    }
    
    public var decimalPointAsComma:Bool {
        get {
            return privateDecimalPointAsComma
        }
        set(newValue) {
            privateDecimalPointAsComma = newValue
            configureDecimalPointButton()
        }
    }
    
    public var textButtons:[UIButton] {
        get {
            var buttons = Array<UIButton>()
            
            for theView in keyboardView.subviews
            {
                if theView.isKindOfClass(PADecimalKeyboardTextButton)
                {
                    buttons.append(theView as! PADecimalKeyboardTextButton)
                }
            }
            
            return buttons
        }
    }
    
    public var numberKeyboardReturnButton:UIButton {
        get {
            return returnButton
        }
    }
    
    public var numberKeyboardBackspaceButton:UIButton {
        get {
            return backspaceButton
        }
    }
    
    public var numberKeyboardView:UIView {
        get {
            return keyboardView
        }
    }
    
    public var allButtons:[UIButton] {
        get {
            var buttons = self.textButtons
            
            buttons.append(backspaceButton)
            buttons.append(returnButton)
            
            return buttons
        }
    }

    public func setSelectedTextButtonBackgroundImage(image:UIImage) {
        selectedTextButtonBackgroundImage = image
        configureSelectedButtonBackgroundImages()
    }
    
    public func setSelectedBackspaceButtonBackgroundImage(image:UIImage) {
        selectedBackspaceButtonBackgroundImage = image
        configureSelectedButtonBackgroundImages()
    }
    
    public func setSelectedReturnButtonBackgroundImage(image:UIImage) {
        selectedReturnButtonBackgroundImage = image
        configureSelectedButtonBackgroundImages()
    }
    
    public func setSelectedTextButtonBackgroundColor(color:UIColor) {
        selectedTextButtonBackgroundImage = PANumberKeyboardViewController.createWithColor(color)
        configureSelectedButtonBackgroundImages()
    }
    
    public func setSelectedBackspaceButtonBackgroundColor(color:UIColor) {
        selectedBackspaceButtonBackgroundImage = PANumberKeyboardViewController.createWithColor(color)
        configureSelectedButtonBackgroundImages()
    }
    
    public func setSelectedReturnButtonBackgroundColor(color:UIColor) {
        selectedReturnButtonBackgroundImage = PANumberKeyboardViewController.createWithColor(color)
        configureSelectedButtonBackgroundImages()
    }
}

// MARK: - Private
extension PANumberKeyboardViewController
{
    private func configureDecimalPointButton()
    {
        dotButton.hidden = !privateAllowDecimalPoint
        zeroSmallButton.hidden = !privateAllowDecimalPoint
        zeroBigButton.hidden = privateAllowDecimalPoint
        dotButton.decimalPointAsComma = decimalPointAsComma
    }
    
    private func processActionType(actionType:ButtonActionType?)
    {
        guard let theActionType = actionType else {
            return
        }
        
        switch theActionType
        {
        case .Backspace:
            processBackspace()
        case .ReturnButton:
            processReturn()
        }
    }
    
    private func processBackspace()
    {
        if let theBackspaceAction = backspaceAction
        {
            self.textDocumentProxy.deleteBackward()
            theBackspaceAction()
        } else {
            self.textDocumentProxy.deleteBackward()
        }
    }
    
    private func processReturn()
    {
        if let theReturnAction = returnAction {
            theReturnAction()
        }
    }
    
    private func processNewText(text:String?)
    {
        guard let theText = text else {
            return
        }
        
        self.textDocumentProxy.insertText(theText)
        
        if let theNewTextAction = newTextAction
        {
            theNewTextAction(text: theText)
        }
    }
    
    private func defaultSelectedButtonImage() -> UIImage
    {
        struct imageInstance {
            static let image = PANumberKeyboardViewController.createWithColor(UIColor.blackColor())
        }
        
        return imageInstance.image
    }
    
    private func configureSelectedButtonBackgroundImages()
    {
        if let theImage = selectedTextButtonBackgroundImage {
            setTextButtonsSelectedButtonBackgroundImage(theImage)
        } else {
            selectedTextButtonBackgroundImage = defaultSelectedButtonImage()
            setTextButtonsSelectedButtonBackgroundImage(selectedTextButtonBackgroundImage!)
        }
        
        if let theImage = selectedReturnButtonBackgroundImage {
            setSelectedButtonImage(returnButton, image:theImage)
        } else {
            selectedReturnButtonBackgroundImage = defaultSelectedButtonImage()
            setSelectedButtonImage(returnButton, image:selectedReturnButtonBackgroundImage!)
        }
        
        if let theImage = selectedBackspaceButtonBackgroundImage {
            setSelectedButtonImage(backspaceButton, image:theImage)
        } else {
            selectedBackspaceButtonBackgroundImage = defaultSelectedButtonImage()
            setSelectedButtonImage(backspaceButton, image:selectedBackspaceButtonBackgroundImage!)
        }
    }
    
    private func setTextButtonsSelectedButtonBackgroundImage(image:UIImage)
    {
        for theView in keyboardView.subviews
        {
            if theView.isKindOfClass(PADecimalKeyboardTextButton)
            {
                let button = theView as! PADecimalKeyboardTextButton
                setSelectedButtonImage(button, image:image)
            }
        }
    }
    
    private func setSelectedButtonImage(button:UIButton, image:UIImage)
    {
        button.setBackgroundImage(image, forState: .Selected)
        button.setBackgroundImage(image, forState: .Highlighted)
    }
}

// MARK: - Tools
extension PANumberKeyboardViewController
{
    private class func createWithColor(color:UIColor) -> UIImage
    {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

