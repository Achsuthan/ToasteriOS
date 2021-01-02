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
        label.numberOfLines = 0
        return label
    }()
    
    private var lblMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var toasterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    ////MARK:- Private variable to handle the toaster appearance
    private var vc: UIViewController?
    private var toasterPossion: ToasterPosition = .top
    private var delay: Int = 4
    private var isShowImage: Bool = false
    private var toasterSquareImageWidth: Double = 40
    
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
        self.setUpToasterImage()
        self.setUpTitle()
        self.setUpMessage()
    }
    
    //MARK:- Toster background view constrains
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
    
    //MARK:- Toaster Image constrains
    private func setUpToasterImage(){
        self.viewBackground.addSubview(self.toasterImage)
        if self.isShowImage{
            self.toasterImage.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor, constant: 10).isActive = true
            self.toasterImage.heightAnchor.constraint(equalToConstant: CGFloat(self.toasterSquareImageWidth)).isActive = true
            self.toasterImage.widthAnchor.constraint(equalToConstant: CGFloat(self.toasterSquareImageWidth)).isActive = true
        }
        else {
            self.toasterImage.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor, constant: 0).isActive = true
            self.toasterImage.widthAnchor.constraint(equalTo: self.viewBackground.heightAnchor, multiplier: 0).isActive = true
            self.toasterImage.heightAnchor.constraint(equalTo: self.viewBackground.heightAnchor, multiplier: 0).isActive = true
        }
        self.toasterImage.centerYAnchor.constraint(equalTo: self.viewBackground.centerYAnchor).isActive = true
        
    }
    
    //MARK:- Toaster title constrains
    private func setUpTitle(){
        self.viewBackground.addSubview(self.lblTitle)
        self.lblTitle.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: 10).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.toasterImage.trailingAnchor, constant: 10).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: -10).isActive = true
        
    }
    
    //MARK:- Toaster Message constrains
    private func setUpMessage(){
        self.viewBackground.addSubview(self.lblMessage)
        self.lblMessage.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor, constant: 2).isActive = true
        self.lblMessage.leadingAnchor.constraint(equalTo: self.toasterImage.trailingAnchor, constant: 10).isActive = true
        self.lblMessage.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor, constant: -10).isActive = true
        self.lblMessage.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor, constant: -10).isActive = true
    }
    
    //MARK:- Show toaster message to user
    public func showToaster(_ title: String? = "", _ message: String? = "", _ position: ToasterPosition? = .top, vc: UIViewController, _ titleStyle: ToasterMessageStyle? = nil, _ messageStyle: ToasterMessageStyle? = nil, _ toasterBacgroundStyle: ToasterBackgroundStyle? = nil, isWithImage: Bool? = false, toasterImage: UIImage? = nil, toasterSquareImageWidth: Double? = 40){
        self.vc = vc
        self.toasterSquareImageWidth = toasterSquareImageWidth ?? 40
        self.toasterPossion = position ?? .top
        if let image = toasterImage {
            self.toasterImage.image = image
        }
        self.isShowImage = isWithImage ?? false
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
            
            if let delay = backgroundStyle.delay {
                self.delay = delay > 3 ? delay : 4
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            self.viewBackground.alpha = 1
        } completion: { (completion) in
            DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(self.delay)) {
                if ((self.vc?.view.isDescendant(of: self.viewBackground)) != nil){
                    self.viewBackground.removeFromSuperview()
                }
            }
        }
    }
}

