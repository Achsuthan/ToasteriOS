//
//  ShowMessage.swift
//  ToasteriOS
//
//  Created by achsum on 26/12/20.
//

import UIKit

public extension UIViewController {
    func viewToasterView(_ title: String?, _ message: String?){
        let toaster = ToasterView()
        toaster.showMessage(title, message, vc: self)
    }
}

