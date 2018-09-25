//
//  LaunchCellView.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    lazy var holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var missionNameLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appBoldFontWithSize(size: 24)
        label.textColor = headingColor
        return label
    }()
    
    lazy var launchedSiteLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appRegularFontWithSize(size: 18)
        return label
    }()
    
    lazy var launchedDateLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appRegularFontWithSize(size: 18)
        return label
    }()
    
    lazy var rocketNameLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appRegularFontWithSize(size: 18)
        return label
    }()
    
    lazy var launchStatusLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appBoldFontWithSize(size: 20)
        return label
    }()
    
    lazy var launchStatusImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Params
    var launchInfo: Launch?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension LaunchCell {
    
    func updateData() {
        if let missionName = launchInfo?.missionName {
            missionNameLbl.text = missionName
        } else {
            missionNameLbl.text = ""
        }
        
        if let launchSiteName = launchInfo?.launchSite?.siteName {
            launchedSiteLbl.text = "Launched at:    \(launchSiteName)"
        } else {
            launchedSiteLbl.text = ""
        }

        if let launchDate = launchInfo?.launchDateUnix {
            launchedDateLbl.text = "Launched on:   \(Date.getLocalDate(launchDate))"
        } else {
            launchedDateLbl.text = ""
        }
        
        if let rocketName = launchInfo?.rocket?.rocketName {
            rocketNameLbl.text = "Rocket used:    \(rocketName)"
        } else {
            rocketNameLbl.text = ""
        }
        
        launchStatusImg.image = UIImage(named: "rocket-icon")

        if let isLaunchSuccess = launchInfo?.launchSuccess, let isUpcoming = launchInfo?.upcoming {
            
            if isLaunchSuccess && !isUpcoming { // Launched and success
                launchStatusLbl.text = "Success"
                launchStatusLbl.textColor = successColor
                launchStatusImg.setImageColor(color: successColor)
            } else if (!isLaunchSuccess && !isUpcoming) { // Launched and failed
                launchStatusLbl.text = "Failed"
                launchStatusLbl.textColor = navBarColor
                launchStatusImg.setImageColor(color: navBarColor)
                
//                let rotationAngle: CGFloat = 90 * (CGFloat.pi / 180)
//                launchStatusImg.transform = CGAffineTransform(rotationAngle: rotationAngle)
            } else { // Yet to launch
                launchStatusLbl.text = "Yet to launch"
                launchStatusLbl.textColor = .lightGray
                launchStatusImg.setImageColor(color: .lightGray)
            }
        } else {
            launchStatusLbl.text = "Data not found"
            launchStatusImg.setImageColor(color: .lightGray)
        }

    }
}

// Setup and layout views
extension LaunchCell {
    
    private func setupViews() {
        selectionStyle = .none
        contentView.backgroundColor = .lightGray
        
        
        // Add subviews
        addSubview(holderView)
        holderView.addSubview(missionNameLbl)
        holderView.addSubview(launchedSiteLbl)
        holderView.addSubview(launchedDateLbl)
        holderView.addSubview(rocketNameLbl)
        holderView.addSubview(launchStatusLbl)
        holderView.addSubview(launchStatusImg)

        // Setup layout
        setupLayout()
        
    }
    
    private func setupLayout() {
        // Horizontal
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: holderView)
        holderView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: missionNameLbl)
        holderView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: launchedSiteLbl)
        holderView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: launchedDateLbl)
        holderView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: rocketNameLbl)
        holderView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-[v1]-8-|", views: launchStatusLbl, launchStatusImg)



        // Vertical
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: holderView)
        holderView.addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1]-8-[v2]-8-[v3]-8-[v4]-8-|", views: missionNameLbl, launchedSiteLbl, launchedDateLbl, rocketNameLbl, launchStatusLbl)
        holderView.addConstraintsWithFormat(format: "V:[v0]-8-[v1]-8-|", views: rocketNameLbl, launchStatusImg)


    }
    

}
