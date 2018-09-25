//
//  ProfileView.swift
//  FutureInSkies
//
//  Created by phanindra on 24/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var username: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var logoutBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = navBarColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

// Setup views and layout
extension ProfileView {
    func setupViews() {
        addSubview(imageView)
        addSubview(username)
        addSubview(logoutBtn)
        
        setupLayout()
    }
    
    func setupLayout() {
        addConstraintsWithFormat(format: "H:[v0(100)]", views: imageView)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: username)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: logoutBtn)
        NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        
        addConstraintsWithFormat(format: "V:|-20-[v0(100)]-20-[v1(50)]-20-[v2(50)]", views: imageView, username, logoutBtn)
    }
    
}
