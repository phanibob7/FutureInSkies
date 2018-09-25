//
//  LoginVC.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        
        setupViews()
        checkAndRemoveProfileVC()
    }
    
    @objc func loginBtnClicked(_ sender: Any) {
        let usernameResponse = Validation.shared.validate(values: (type: ValidationType.username, inputValue: loginView.userNameTxtField.text!))
        switch usernameResponse {
        case .success:
            break
        case .failure(_, let message):
            self.present(createAlertithMessage(string: message.localized()), animated: true, completion: nil)
            return
        }
        
        let passwordResponse = Validation.shared.validate(values: (type: ValidationType.password, inputValue: loginView.passwordTxtField.text!))
        switch passwordResponse {
        case .success:
            break
        case .failure(_, let message):
            self.present(createAlertithMessage(string: message.localized()), animated: true, completion: nil)
            return
        }
        
        UserDefaults.standard.set(loginView.userNameTxtField.text!, forKey: kUsername)
        UserDefaults.standard.set(true, forKey: kIsUserLoggedIn)
        
        navigationController?.pushViewController(ProfileVC(), animated: true)
    }
    
    func checkAndRemoveProfileVC() {
        var vcs = self.navigationController?.viewControllers
        for (index, vc) in (self.navigationController?.viewControllers.enumerated())! {
            if vc is ProfileVC {
                vcs?.remove(at: index)
            }
        }
        self.navigationController?.viewControllers = vcs!
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}

extension LoginVC {
    func setupViews() {
        view.addSubview(loginView)
        
        setupLayout()
        setupActions()
    }
    
    func setupLayout() {
        let heightOfNavigationBar = 44.0
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: loginView)
        view.addConstraintsWithFormat(format: "V:|-\(heightOfNavigationBar + 40)-[v0]-0-|", views: loginView)
    }
    
    func setupActions() {
        loginView.userNameTxtField.becomeFirstResponder()
        
        loginView.userNameTxtField.delegate = self
        loginView.passwordTxtField.delegate = self
        
        loginView.loginBtn.addTarget(self, action: #selector(loginBtnClicked(_:)), for: .touchUpInside)
    }
}
