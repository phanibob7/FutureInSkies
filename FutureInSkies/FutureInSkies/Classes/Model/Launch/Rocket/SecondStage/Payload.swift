//
//  Payload.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Payload: Decodable {
    var payloadId: String?
    var noradId: [Int]?
    var reused: Bool?
    var customers: [String]?
    var nationality: String?
    var manufacturer: String?
    var payloadType: String?
    var payloadMassKg: Double?
    var payloadMassLbs: Double?
    var orbit: String?
    var orbitParams: OrbitParams?
    
    private enum CodingKeys: String, CodingKey {
        case payloadId = "payload_id"
        case noradId = "norad_id"
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbitParams = "orbit_params"
        case reused, customers, nationality, manufacturer, orbit
    }
}

/*
 "payload_id":"Telstar 18V",
 "norad_id":[  ],
 "reused":false,
 "customers":[  ],
 "nationality":"Canada",
 "manufacturer":"SSL",
 "payload_type":"Satellite",
 "payload_mass_kg":7060,
 "payload_mass_lbs":15564.64,
 "orbit":"GTO",
 "orbit_params":{  }
 */

