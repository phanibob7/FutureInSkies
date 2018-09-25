//
//  LaunchView.swift
//  FutureInSkies
//
//  Created by phanindra on 24/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class LaunchView: UIView {
    
    var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Launch Info"
        label.textColor = headingColor
        label.font = UIFont.appBoldFontWithSize(size: 24)
        return label
    }()
    
    var flightNumberLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var missionNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var launchSiteLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var launchDateLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()

    var customerLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var launchStatusLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appBoldFontWithSize(size: 20)
        return label
    }()
    
    // Rocket
    var rocketHeaderLbl: UILabel = {
        let label = UILabel()
        label.text = "Rocket"
        label.textColor = headingColor
        label.font = UIFont.appBoldFontWithSize(size: 24)
        return label
    }()
    
    var rocketNameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var rocketTypeLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    // Core
    var coreHeaderLbl: UILabel = {
        let label = UILabel()
        label.text = "Core"
        label.textColor = headingColor
        label.font = UIFont.appBoldFontWithSize(size: 24)
        return label
    }()

    var coreSerialLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var landingTypeLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var landingSuccessLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    // Payload
    var payloadHeaderLbl: UILabel = {
        let label = UILabel()
        label.text = "Payload"
        label.textColor = headingColor
        label.font = UIFont.appBoldFontWithSize(size: 24)
        return label
    }()

    var manufacturerLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var payloadTypeLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var payloadMassKgLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()
    
    var detailsLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.appRegularFontWithSize(size: 20)
        return label
    }()

    var wikiLinkBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.titleLabel?.textColor = .white
        button.setTitle("Wikipedia", for: .normal)
        button.titleLabel?.font = UIFont.appBoldFontWithSize(size: 20)
        return button
    }()
    
    var youtubeBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.titleLabel?.textColor = .white
        button.setTitle("Youtube", for: .normal)
        button.titleLabel?.font = UIFont.appBoldFontWithSize(size: 20)
        return button
    }()
    
    var launchInfo: Launch? {
        didSet {
            self.updateData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData() {
        if let flightNumber = launchInfo?.flightNumber {
            flightNumberLbl.text = "Number:   \(flightNumber)"
        }
        
        if let missionName = launchInfo?.missionName {
            missionNameLbl.text = "Name:   \(missionName)"
        }
        
        if let launchSite = launchInfo?.launchSite?.siteName {
            launchSiteLbl.text = "Site:   \(launchSite)"
        }
        
        if let launchDate = launchInfo?.launchDateUnix {
            launchDateLbl.text = "Launched on:   \(Date.getLocalDate(launchDate))"
        }
                
        if let customer = (launchInfo?.rocket?.secondStage?.payloads![0])?.customers![0] {
            customerLbl.text = "Customer:   \(customer)"
        }
        
        if let isLaunchSuccess = launchInfo?.launchSuccess {
            launchStatusLbl.text = "Launch \(isLaunchSuccess ? "success" : "failed")"
            launchStatusLbl.textColor = isLaunchSuccess ? successColor : navBarColor
        }
        
        if let details = launchInfo?.details {
            detailsLbl.text = "\(details)"
        }
        
        if let rocketName = launchInfo?.rocket?.rocketName {
            rocketNameLbl.text = "Name:   \(rocketName)"
        }
        
        if let rocketType = launchInfo?.rocket?.rocketType {
            rocketNameLbl.text = "Type:   \(rocketType)"
        }
        
        if let serial = (launchInfo?.rocket?.firstStage?.cores![0])?.coreSerial {
            coreSerialLbl.text = "Serial:   \(serial)"
        }
        
        if let landingType = (launchInfo?.rocket?.firstStage?.cores![0])?.landingType {
            landingTypeLbl.text = "Type:   \(landingType)"
        }
        
        if let isLandingSuccess = (launchInfo?.rocket?.firstStage?.cores![0])?.landSuccess {
            landingSuccessLbl.text = "Landing \(isLandingSuccess ? "success" : "failed")"
            landingSuccessLbl.textColor = isLandingSuccess ? successColor : navBarColor
        }

        if let manufacturer = (launchInfo?.rocket?.secondStage?.payloads![0])?.manufacturer {
            manufacturerLbl.text = "Manufacturer:   \(manufacturer)"
        }
        
        if let type = (launchInfo?.rocket?.secondStage?.payloads![0])?.payloadType {
            payloadTypeLbl.text = "Type:   \(type)"
        }
        
        if let massInKg = (launchInfo?.rocket?.secondStage?.payloads![0])?.payloadMassKg {
            payloadMassKgLbl.text = "Mass:   \(massInKg) Kg"
        }
    }
}

// Setup views and layout
extension LaunchView {
    func setupViews() {
        addSubviews(views: [titleLbl, flightNumberLbl, missionNameLbl, launchDateLbl, wikiLinkBtn, youtubeBtn, customerLbl, rocketHeaderLbl, rocketNameLbl, rocketTypeLbl, coreHeaderLbl, coreSerialLbl, landingTypeLbl, payloadHeaderLbl, manufacturerLbl, payloadTypeLbl, payloadMassKgLbl, detailsLbl, launchStatusLbl, launchSiteLbl, landingSuccessLbl])
        
        setupLayout()
    }
    
    func setupLayout() {
        addSameConstraintToViews(format: "H:|-20-[v0]-20-|", views: [titleLbl, flightNumberLbl, missionNameLbl, launchDateLbl, customerLbl, wikiLinkBtn, youtubeBtn, rocketHeaderLbl, rocketNameLbl, rocketTypeLbl, coreHeaderLbl, coreSerialLbl, landingTypeLbl, payloadHeaderLbl, manufacturerLbl, payloadTypeLbl, payloadMassKgLbl, detailsLbl, launchStatusLbl, launchSiteLbl, landingSuccessLbl])
        
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-[v1]-10-[v2]-10-[v3]-10-[v4]-10-[v5]-10-[v6]-25-[v7]-10-[v8]-10-[v9]-25-[v10]-10-[v11]-10-[v12]-10-[v13]-25-[v14]-10-[v15]-10-[v16]-10-[v17]-10-[v18]-20-[v19(50)]-20-[v20(50)]-20-|", views: titleLbl, flightNumberLbl, missionNameLbl, launchSiteLbl, launchDateLbl, customerLbl, launchStatusLbl, rocketHeaderLbl, rocketNameLbl, rocketTypeLbl, coreHeaderLbl, coreSerialLbl, landingTypeLbl, landingSuccessLbl, payloadHeaderLbl, manufacturerLbl, payloadTypeLbl, payloadMassKgLbl, detailsLbl, wikiLinkBtn, youtubeBtn)
    }
    
}

