//
//  LaunchSite.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct LaunchSite: Decodable {
    var siteId: String?
    var siteName: String?
    var siteNameLong: String?
    
    private enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

/*
 "site_id":"ccafs_slc_40",
 "site_name":"CCAFS SLC 40",
 "site_name_long":"Cape Canaveral Air Force Station Space Launch Complex 40"
 */
