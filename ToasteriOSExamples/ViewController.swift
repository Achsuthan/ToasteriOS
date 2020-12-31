//
//  ViewController.swift
//  ToasteriOSExamples
//
//  Created by achsum on 26/12/20.
//

import UIKit

enum optionEnum {
    case titleOnly, titleWithStyle, titleWithMessage, titleWithMessageStyle, customToasterBackground, topToaster, MiddleToaster, bottomToaster
}

struct toasterOptions {
    var title: String
    var type: optionEnum
}

class ViewController: UIViewController {
    
    var toastertabel: UITableView = {
        let tabel = UITableView()
        tabel.translatesAutoresizingMaskIntoConstraints = false
        return tabel
    }()
    
    var toasterOptionArray:[toasterOptions] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        
        self.toasterOptionArray.append(toasterOptions(title: "Tittle Only", type: .titleOnly))
        self.toasterOptionArray.append(toasterOptions(title: "Tittle with style", type: .titleWithStyle))
        self.toasterOptionArray.append(toasterOptions(title: "Tittle and Message", type: .titleWithMessage))
        self.toasterOptionArray.append(toasterOptions(title: "Tittle and Message with custom style", type: .titleWithMessageStyle))
        self.toasterOptionArray.append(toasterOptions(title: "Custom Toaster background", type: .customToasterBackground))
        self.toasterOptionArray.append(toasterOptions(title: "Show Toaster on top", type: .topToaster))
        self.toasterOptionArray.append(toasterOptions(title: "Show Toaster on middle", type: .MiddleToaster))
        self.toasterOptionArray.append(toasterOptions(title: "Show Toaster on bottom", type: .bottomToaster))
        
        self.view.addSubview(self.toastertabel)
        self.toastertabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.toastertabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.toastertabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.toastertabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.toastertabel.delegate = self
        self.toastertabel.dataSource = self
        self.toastertabel.register(ToasterTableViewCell.self, forCellReuseIdentifier: "ToasterTableViewCell")
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toasterOptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToasterTableViewCell", for: indexPath) as! ToasterTableViewCell
        cell.selectionStyle = .none
        cell.lblTitle.text = self.toasterOptionArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.toasterOptionArray[indexPath.row].type {
        case .MiddleToaster:
            self.showToaster(title: "Success", message: "Hello World!", position: .middle)
        case .topToaster:
            self.showToaster(title: "Success", message: "Hello World!", position: .top)
        case .bottomToaster:
            self.showToaster(title: "Success", message: "Hello World!", position: .bottom)
        case .customToasterBackground:
            var backgroundStyle  = ToasterBackgroundStyle()
            backgroundStyle.backgroundColor = .blue
            backgroundStyle.cornerRadius = 10
            backgroundStyle.delay = 5
            self.showToaster(title: "Success", message: "Hello World!", position: .bottom, titleStyle: nil, messageStyle: nil, toasterBacgroundStyle: backgroundStyle)
        case .titleOnly:
            self.showToaster(title: "Success")
        case .titleWithMessage:
            self.showToaster(title: "Success", message: "Hello World!")
        case .titleWithStyle:
            var titleStyle  = ToasterMessageStyle()
            titleStyle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            titleStyle.textColor = .green
            titleStyle.textAlignment = .center
            self.showToaster(title: "Success", message: nil, position: nil, titleStyle: titleStyle)
        case .titleWithMessageStyle:
            var titleStyle  = ToasterMessageStyle()
            titleStyle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            titleStyle.textColor = .red
            titleStyle.textAlignment = .center
            
            var messageStyle  = ToasterMessageStyle()
            messageStyle.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            messageStyle.textColor = .white
            messageStyle.textAlignment = .center
            self.showToaster(title: "Success", message: "Hello World!", position: nil, titleStyle: titleStyle, messageStyle: messageStyle)
        }
    }
    
}

