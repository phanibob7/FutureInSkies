//
//  ScrollableVC.swift
//  FutureInSkies
//
//  Created by phanindra on 24/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

class ScrollableVC: UIViewController {

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var contentView: UIView = {
       let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
        scrollView.bounces = false
        
        let screenWidth = UIScreen.main.bounds.width
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        scrollView.addConstraintsWithFormat(format: "H:|[v0(\(screenWidth))]|", views: contentView)
        scrollView.addConstraintsWithFormat(format: "V:|[v0]|", views: contentView)
//
//        let dummyView = UIView(frame: CGRect(x: 100, y: 1900, width: 100, height: 100))
//        dummyView.backgroundColor = .red
//        contentView.addSubview(dummyView)
            
        
    }
}
