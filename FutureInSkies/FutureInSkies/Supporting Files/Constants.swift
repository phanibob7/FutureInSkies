//
//  Constants.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit

// API related
let SPACEX_API = "https://api.spacexdata.com"
let API_VERSION = "/v2"

let LAUNCHES_URL = SPACEX_API + API_VERSION + "/launches"

let LATEST_LAUNCH = LAUNCHES_URL + "/latest"

// User defaults related
let kIsUserLoggedIn = "IsUserLoggedIn"
let kUsername = "Username"

// Tableview cell reuseidentifiers
let LAUNCH_CELL_ID = "LaunchCell"

let navBarColor = UIColor(rgb: 0xe25822)
let successColor = UIColor(rgb: 0x208e2f)
let headingColor = UIColor(rgb: 0x2d579b)
