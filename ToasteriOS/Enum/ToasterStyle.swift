//
//  ToasterStyle.swift
//  ToasteriOS
//
//  Created by achsum on 27/12/20.
//

import UIKit

/**
  Toaster text style.
 
  *Values*
 
  `font:` This is used to customize your font can use the system font or your own font.
 
  `textColor:` Colour of the text you can pass the UIColor.
 
  `textAlignment:` This is used to align the text whatever you want parameter should be NSTextAlignment.
 
  - Author:
    Achsuthan Mahendran
 */

public struct ToasterMessageStyle {
    public var font: UIFont?
    public var textColor: UIColor?
    public var textAlignment: NSTextAlignment?
}


/**
  Toaster background view style.
 
  *Values*
 
  `backgroundColor:` This is used to customize your toaster message backgorund colour this should be UIColor.
 
  `cornerRadius:` How the radius of the toaster background looks like its should be Double value.
 
  `delay:` How much of time you want to display the toaster message minimum should be 4 sec.
 
  - Author:
    Achsuthan Mahendran
 */
public struct ToasterBackgroundStyle {
    public var backgroundColor: UIColor?
    public var cornerRadius: Double?
    public var delay: Int?
}
