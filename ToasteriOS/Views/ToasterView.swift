//
//  ToasterView.swift
//  ToasteriOS
//
//  Created by achsum on 26/12/20.
//

import UIKit
@available(iOS 11.0, *)
public class ToasterView: UIView {
    //MARK:- Components
    private let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        view.alpha = 0
        return view
    }()
    
    private var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    private var lblMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private var vc: UIViewController?
    private var toasterPossion: ToasterPosition = .top
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        guard let vc = self.vc else {
            return
        }
        self.setUpToasterView(in: vc)
        self.setUpTitle()
        self.setUpMessage()
    }
    
    private func setUpToasterView(in vc: UIViewController){
        vc.view.addSubview(self.viewBackground)
        switch self.toasterPossion {
        case .top:
            self.viewBackground.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        case .bottom:
            self.viewBackground.bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        case .middle:
            self.viewBackground.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
            self.viewBackground.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        }
        
        self.viewBackground.widthAnchor.constraint(lessThanOrEqualTo: vc.view.widthAnchor, multiplier: 0.88).isActive = true
        self.viewBackground.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        let tmp = self.viewBackground.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        tmp.isActive = true
        tmp.priority = UILayoutPriority(250)
    }
    
    private func setUpTitle(){
        self.viewBackground.addSubview(self.lblTitle)
        self.lblTitle.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: 10).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor, constant: 10).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: -10).isActive = true
        
    }
    
    private func setUpMessage(){
        self.viewBackground.addSubview(self.lblMessage)
        self.lblMessage.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 2).isActive = true
        self.lblMessage.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor, constant: 10).isActive = true
        self.lblMessage.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: -10).isActive = true
        self.lblMessage.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor, constant: -10).isActive = true
    }
    
    public func showToaster(_ title: String? = "", _ message: String? = "", _ position: ToasterPosition? = .top, vc: UIViewController, _ titleStyle: ToasterMessageStyle? = nil, _ messageStyle: ToasterMessageStyle? = nil, _ toasterBacgroundStyle: ToasterBackgroundStyle? = nil){
        self.vc = vc
        self.toasterPossion = position ?? .top
        self.setUp()
        if let title = title {
            self.lblTitle.text = title
        }
        
        if let message = message {
            self.lblMessage.text = message
        }
        if let titleStyle = titleStyle {
            if let font  = titleStyle.font {
                self.lblTitle.font = font
            }
            
            if let textColor = titleStyle.textColor {
                self.lblTitle.textColor = textColor
            }
            
            if let alignment = titleStyle.textAlignment {
                self.lblTitle.textAlignment = alignment
            }
        }
        
        if let messageStyle = messageStyle {
            if let font  = messageStyle.font {
                self.lblMessage.font = font
            }
            
            if let textColor = messageStyle.textColor {
                self.lblMessage.textColor = textColor
            }
            
            if let alignment = messageStyle.textAlignment {
                self.lblMessage.textAlignment = alignment
            }
        }
        
        if let backgroundStyle = toasterBacgroundStyle {
            if let bacgroundColor = backgroundStyle.backgroundColor {
                self.viewBackground.backgroundColor = bacgroundColor
            }
            
            if let cornerRadius = backgroundStyle.cornerRadius {
                self.viewBackground.layer.cornerRadius = CGFloat(cornerRadius)
            }
        }
        
        UIView.animate(withDuration: 1, delay: 0.1, options: .curveLinear) {
            self.viewBackground.alpha = 1
        } completion: { (completion) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                if ((self.vc?.view.isDescendant(of: self.viewBackground)) != nil){
                    self.viewBackground.removeFromSuperview()
                }
            }
        }
    }
}

