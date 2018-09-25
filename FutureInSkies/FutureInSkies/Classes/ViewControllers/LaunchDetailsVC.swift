//
//  LaunchDetailsVC.swift
//  FutureInSkies
//
//  Created by phanindra on 23/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class LaunchDetailsVC: ScrollableVC {

    var launchInfo: Launch?
    
    let launchView = LaunchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        if let missionName = launchInfo?.missionName {
            title = missionName
        }
        
        if let info = launchInfo {
            launchView.launchInfo = info
        }
        
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    @objc func openWikiLink(_ sender: Any) {
        if let wikiLink = launchInfo?.links?.wikipedia {
            guard let url = URL(string: wikiLink) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc func openYoutube(_ sender: Any) {
        if let youtubeLink = launchInfo?.links?.videoLink {
            guard let youtubeUrl = URL(string: youtubeLink.replacingOccurrences(of: "https", with: "youtube")) else { return }
            guard let url = URL(string: youtubeLink) else { return }

            if UIApplication.shared.canOpenURL(youtubeUrl) {
                UIApplication.shared.open(youtubeUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

extension LaunchDetailsVC {
    func setupViews() {
        contentView.addSubview(launchView)
        setupLayout()
        setupActions()
    }
    
    func setupLayout() {
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: launchView)
        contentView.addConstraintsWithFormat(format: "V:|[v0]|", views: launchView)
    }
    
    func setupActions() {
        launchView.wikiLinkBtn.addTarget(self, action: #selector(self.openWikiLink(_:)), for: .touchUpInside)
        launchView.youtubeBtn.addTarget(self, action: #selector(openYoutube(_:)), for: .touchUpInside)
    }
}
