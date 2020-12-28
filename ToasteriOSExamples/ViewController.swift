//
//  ViewController.swift
//  ToasteriOSExamples
//
//  Created by achsum on 26/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showToaster(title: "Success", message: "Hello World!", position: .middle)
        self.showToaster(title: "Success", message: "Hello World!", position: .bottom, titleStyle: ToasterMessageStyle(font: UIFont.systemFont(ofSize: 24, weight: .bold), textColor: .red, textAlignment: .center), messageStyle: ToasterMessageStyle(font: UIFont.systemFont(ofSize: 20, weight: .heavy), textColor: .white, textAlignment: .center), toasterBacgroundStyle: ToasterBackgroundStyle(backgroundColor: .black, cornerRadius: 10))
    }


}

