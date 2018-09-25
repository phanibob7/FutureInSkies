//
//  OrbitParams.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct OrbitParams: Decodable {
    var referenceSystem: String?
    var regime: String?
    var longitude: Double?
    var semiMajorAxisKm: Double?
    var eccentricity: Double?
    var periapsisKm: Double?
    var apoapsisKm: Double?
    var inclinationDeg: Double?
    var periodMin: Double?
    var lifespanYears: Int?
    var epoch: String?
    var meanMotion: Double?
    var raan: Double?
    var argOfPericenter: Double?
    var meanAnomaly: Double?
    
    private enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case semiMajorAxisKm = "semi_major_axis_km"
        case periapsisKm = "periapsis_km"
        case apoapsisKm = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
        case periodMin = "period_min"
        case lifespanYears = "lifespan_years"
        case meanMotion = "mean_motion"
        case argOfPericenter = "arg_of_pericenter"
        case meanAnomaly = "mean_anomaly"
        case regime, longitude, eccentricity, epoch, raan
    }
}


/*
 
 "reference_system":"geocentric",
 "regime":"geostationary",
 "longitude":138,
 "semi_major_axis_km":7226.647,
 "eccentricity":0.0013608,
 "periapsis_km":838.677,
 "apoapsis_km":858.346,
 "inclination_deg":98.8086,
 "period_min":101.897,
 "lifespan_years":15,
 "epoch":"2018-09-07T06:29:40.000Z",
 "mean_motion":14.13180055,
 "raan":322.194,
 "arg_of_pericenter":130.3173,
 "mean_anomaly":328.1487
 
 */
