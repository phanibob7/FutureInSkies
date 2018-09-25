//
//  SecondStage.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct SecondStage: Decodable {
    var block: Int?
    var payloads: [Payload]?
    
    private enum CodingKeys: String, CodingKey {
        case block, payloads
    }
}

/*
 "block":5,
 "payloads":[  ]
 */
