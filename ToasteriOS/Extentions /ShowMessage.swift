//
//  ShowMessage.swift
//  ToasteriOS
//
//  Created by achsum on 26/12/20.
//

import UIKit
@available(iOS 11.0, *)
public extension UIViewController {
    func showToaster(_ title: String?, _ message: String?){
        let toaster = ToasterView()
        toaster.showToaster(title, message, vc: self)
    }
    
    func showToaster(_ title: String?, _ message: String?, _ possion: ToasterPossion?){
        let toaster = ToasterView()
        toaster.showToaster(title, message, possion, vc: self)
    }
}

