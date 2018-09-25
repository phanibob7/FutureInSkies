//
//  Rocket.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Rocket: Decodable {
    var rocketId: String?
    var rocketName: String?
    var rocketType: String?
    var firstStage: FirstStage?
    var secondStage: SecondStage?
    var fairings: Fairings?
    
    private enum CodingKeys: String, CodingKey {
        case rocketId = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

/*
 {
 "rocket_id":"falcon9",
 "rocket_name":"Falcon 9",
 "rocket_type":"FT",
 "first_stage":{  },
 "second_stage":{  },
 "fairings":{  }
 },
 */
