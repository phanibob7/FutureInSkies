//
//  Core.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Core: Decodable {
    var coreSerial: String?
    var flight: Int?
    var block: Int?
    var reused: Bool?
    var landSuccess: Bool?
    var landingType: String?
    var landingVehicle: String?
    
    private enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case landSuccess = "land_success"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
        case flight, block
    }
}

/*
 
 "core_serial":"B1049",
 "flight":1,
 "block":5,
 "reused":false,
 "land_success":true,
 "landing_type":"ASDS",
 "landing_vehicle":"OCISLY"
 
 */
