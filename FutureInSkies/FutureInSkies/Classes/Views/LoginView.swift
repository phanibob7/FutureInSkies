//
//  LoginView.swift
//  FutureInSkies
//
//  Created by phanindra on 23/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var userNameTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username (a-z, A-Z, 0-9)"
        textField.font = UIFont.appRegularFontWithSize(size: 18)
        return textField
    }()
    
    var passwordTxtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password (6-15 characters)"
        textField.font = UIFont.appRegularFontWithSize(size: 18)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var loginBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.appBoldFontWithSize(size: 18)
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
extension LoginView {
    func setupViews() {
        addSubview(userNameTxtField)
        addSubview(passwordTxtField)
        addSubview(loginBtn)
        
        userNameTxtField.addLine(position: .bottom, color: .lightGray, width: 0.5)
        passwordTxtField.addLine(position: .bottom, color: .lightGray, width: 0.5)
        
        setupLayout()
    }
    
    func setupLayout() {
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: userNameTxtField)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: passwordTxtField)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: loginBtn)

        addConstraintsWithFormat(format: "V:|-20-[v0(50)]-20-[v1(50)]-20-[v2(50)]", views: userNameTxtField, passwordTxtField, loginBtn)
    }
    
}
