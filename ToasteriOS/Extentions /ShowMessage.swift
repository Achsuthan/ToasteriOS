//
//  ShowMessage.swift
//  ToasteriOS
//
//  Created by achsum on 26/12/20.
//

import UIKit
@available(iOS 11.0, *)
public extension UIViewController {
    func showToaster(title: String? = "", message: String? = "", position: ToasterPosition? = .top, titleStyle: ToasterMessageStyle? = nil, messageStyle: ToasterMessageStyle? = nil, toasterBacgroundStyle: ToasterBackgroundStyle? = nil){
        let toaster = ToasterView()
        toaster.showToaster(title, message, position, vc: self, titleStyle, messageStyle, toasterBacgroundStyle)
    }
}

