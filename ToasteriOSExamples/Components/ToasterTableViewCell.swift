//
//  ToasterTableViewCell.swift
//  ToasteriOSExamples
//
//  Created by achsum on 28/12/20.
//

import UIKit

class ToasterTableViewCell: UITableViewCell {
    
    var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        self.contentView.addSubview(self.lblTitle)
        self.lblTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        self.lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
}
