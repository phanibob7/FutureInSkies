//
//  Extentions.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

// UIView constraints
extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach({
            self.addSubview($0)
        })
    }
    
    func addSameConstraintToViews(format: String, views: [UIView]) {
        views.forEach({
            self.addConstraintsWithFormat(format: format, views: $0)
        })
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    enum LinePosition {
        case top
        case bottom
    }
    
    func addLine(position : LinePosition, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}

extension UITableView {
    func removeEmptyCells() {
        self.tableFooterView = UIView()
    }
    
    func registerCellClasses(_ cellClasses: [AnyClass]) {
        cellClasses.forEach({
            let identifier = String(describing: $0.self)
            self.register($0.self, forCellReuseIdentifier: identifier)
        })
    }

    func registerCellNibs(_ cellClasses: [AnyClass]) {
        cellClasses.forEach({
            let identifier = String(describing: $0.self)
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        })
    }
    
    func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
        let identifier = String(describing: viewClass.self)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String(describing: viewClass.self)
        self.register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIFont {
    class func appRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "ArialMT", size: size)!
    }
    
    class func appBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-BoldMT", size: size)!
    }
}

extension UIViewController {
    func createLabelHeader(title: String) -> UIBarButtonItem {
        let button = UIButton()
        button.titleLabel?.font = UIFont.appBoldFontWithSize(size: 24)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false

        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }
    
    func createAccountButton(in vc: UIViewController, action: Selector) {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(#imageLiteral(resourceName: "account"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "account"), for: .highlighted)
        button.addTarget(vc, action: action, for: .touchUpInside)

//        button.backgroundColor = .red
        let barButton = UIBarButtonItem(customView: button)
        vc.navigationItem.rightBarButtonItem = barButton
    }
    
    func createAlertithMessage(string: String) -> UIAlertController {
        let alert = UIAlertController(title: "", message: string, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        return alert
    }
}

extension Date {
    static func getLocalDate(_ timeStamp: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: Date(timeIntervalSince1970: timeStamp))
    }
}
