//
//  Launch.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

/*
 {
 "flight_number":68,
 "mission_name":"Telstar 18V",
 "mission_id":[  ],
 "launch_year":"2018",
 "launch_date_unix":1536554700,
 "launch_date_utc":"2018-09-10T04:45:00.000Z",
 "launch_date_local":"2018-09-10T00:45:00-04:00",
 "is_tentative":false,
 "tentative_max_precision":"hour",
 "rocket":{  },
 "ships":[  ],
 "telemetry":{  },
 "reuse":{  },
 "launch_site":{  },
 "launch_success":true,
 "links":{  },
 "details":"",
 "upcoming":false,
 "static_fire_date_utc":"2018-09-05T07:21:00.000Z",
 "static_fire_date_unix":1536132060
 }
 */

import Foundation

struct Launch: Decodable {
    var flightNumber: Int?
    var missionName: String?
    var missionId: [String]?
    var launchYear: String?
    var launchDateUnix: Double?
    var launchDateUtc: String?
    var launchDateLocal: String?
    var isTentative: Bool?
    var tentativeMaxPrecision: String?
    var rocket: Rocket?
    var ships: [String]?
    var telemetry: Telemetry?
    var reuse: Reuse?
    var launchSite: LaunchSite?
    var launchSuccess: Bool?
    var links: Links?
    var details: String?
    var upcoming: Bool?
    var staticFireDateUtc: String?
    var staticFireDateUnix: Double?
    
    private enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionId = "mission_id"
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUtc = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case staticFireDateUtc = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case rocket, ships, telemetry, reuse, links, details, upcoming
    }
}

