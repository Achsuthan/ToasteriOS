//
//  ShowMessage.swift
//  ToasteriOS
//
//  Created by achsum on 26/12/20.
//

import UIKit
@available(iOS 11.0, *)
public extension UIViewController {
    /**
      Present the toaster message.
     
     
     - parameter title: Special first line of the toaster message, Eg: Success/Failure.
     
     - parameter message: Details description of the toaster message, this can be used to explain what is the message.
     
     - parameter position: Possion of the toaster message, top/middle/bottom.
     
     - parameter titleStyle: Can tell the toaster message what do is the customization you wanted to the title.
        
     - parameter messageStyle: Can tell the toaster message what do is the customization you wanted to the message.
     
     - parameter toasterBacgroundStyle: Can tell the toaster message how the toaster background should be looks like.
     
      - Author:
        Achsuthan Mahendran
     */
    
    func showToaster(title: String? = "", message: String? = "", position: ToasterPosition? = .top, titleStyle: ToasterMessageStyle? = nil, messageStyle: ToasterMessageStyle? = nil, toasterBacgroundStyle: ToasterBackgroundStyle? = nil, isWithImage: Bool? = false, toasterImage: UIImage? = nil, toasterSquareImageWidth: Double? = 40){
        let toaster = ToasterView()
        toaster.showToaster(title, message, position, vc: self, titleStyle, messageStyle, toasterBacgroundStyle, isWithImage: isWithImage, toasterImage: toasterImage, toasterSquareImageWidth: toasterSquareImageWidth)
    }
}

