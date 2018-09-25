//
//  Fairings.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Fairings: Decodable {
    var reused: Bool?
    var recoveryAttempt: Bool?
    var recovered: Bool?
    var ship: String?
    
    private enum CodingKeys: String, CodingKey {
        case recoveryAttempt = "recovery_attempt"
        case reused, recovered, ship
    }
}

/*
 "reused":false,
 "recovery_attempt":false,
 "recovered":false,
 "ship":null
 */
