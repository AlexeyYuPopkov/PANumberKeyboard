# PANumberKeyboard
Swift 2.3
Customizible Number Keyboard with optional decimal point
https://www.youtube.com/watch?v=55QPbAQwGRM

### Install:
```sh
use_frameworks!
platform :ios, '8.0'
pod 'PANumberKeyboard'
```
### Usage:

Swift:
```sh
import PANumberKeyboard
……
let keyboardVC = PANumberKeyboardViewController.createDecimalKeyboard()
keyboardVC.allowDecimalPoint = true        
keyboardVC.numberKeyboardReturnButton.setTitle("Next", forState: .Normal)

self.textField.inputView = self.keyboardVC.numberKeyboardView
```

Objective-C:
```sh
#import <PANumberKeyboard/PANumberKeyboard-Swift.h>
……
PANumberKeyboardViewController *keyboard = [PANumberKeyboardViewController createDecimalKeyboard];
[keyboard setAllowDecimalPoint:YES];
[[keyboard numberKeyboardReturnButton] setTitle:@“Next” forState:UIControlStateNormal];

[[self textField] setInputView:[keyboard numberKeyboardView]];
```
### Customization:
Buttons Callbacks
```sh
public var backspaceAction:((Void) -> Void)?
public var newTextAction:((text:String) -> Void)?
public var returnAction:((Void) -> Void)?
```
Button Background Color/Image for Selected State
```sh
public func setSelectedTextButtonBackgroundImage(image:UIImage)
public func setSelectedBackspaceButtonBackgroundImage(image:UIImage)
public func setSelectedReturnButtonBackgroundImage(image:UIImage)
public func setSelectedTextButtonBackgroundColor(color:UIColor)
public func setSelectedBackspaceButtonBackgroundColor(color:UIColor)
public func setSelectedReturnButtonBackgroundColor(color:UIColor)
```
Allow Decimal Point
```sh
public var allowDecimalPoint:Bool
```
Present Decimal Point as “.” or “,”
```sh
public var decimalPointAsComma:Bool
```
Getters for button customization
```sh
public var numberKeyboardBackspaceButton:UIButton // Backspace Button
public var numberKeyboardReturnButton:UIButton // Return Button
public var textButtons:[UIButton] // “0”-“9” and “.” Button Array
public var allButtons:[UIButton] // Array of all buttons
```
### Donates:
money.yandex.ru/to/410014452669555