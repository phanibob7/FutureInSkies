//
//  ProfileVC.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white

        setupViews()
        profileView.username.text = UserDefaults.standard.string(forKey: kUsername)
        profileView.imageView.image = #imageLiteral(resourceName: "account")
        checkAndRemoveLoginVC()
    }

    @objc func logoutBtnClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: kIsUserLoggedIn)
        UserDefaults.standard.set("", forKey: kUsername)
        navigationController?.pushViewController(LoginVC(), animated: true)
    }
    
    func checkAndRemoveLoginVC() {
        var vcs = self.navigationController?.viewControllers
        for (index, vc) in (self.navigationController?.viewControllers.enumerated())! {
            if vc is LoginVC {
                vcs?.remove(at: index)
            }
        }
        self.navigationController?.viewControllers = vcs!
    }
}

extension ProfileVC {
    func setupViews() {
        view.addSubview(profileView)
        
        setupLayout()
        setupActions()
    }
    
    func setupLayout() {
        let heightOfNavigationBar = 44.0
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: profileView)
        view.addConstraintsWithFormat(format: "V:|-\(heightOfNavigationBar + 40)-[v0]|", views: profileView)
    }
    
    func setupActions() {
        profileView.logoutBtn.addTarget(self, action: #selector(logoutBtnClicked(_:)), for: .touchUpInside)
    }
}
