//
//  Telemetry.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Telemetry: Decodable {
    var flightClub: String?
    
    private enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}
/*
 "flight_club":"https://www.flightclub.io/result/2d?code=T18V"
 */
