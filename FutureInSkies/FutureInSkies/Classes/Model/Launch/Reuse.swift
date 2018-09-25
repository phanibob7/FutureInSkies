//
//  Reuse.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Reuse: Decodable {
    var core: Bool?
    var sideCore1: Bool?
    var sideCore2: Bool?
    var fairings: Bool?
    var capsule: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case sideCore1 = "side_core1"
        case sideCore2 = "side_core2"
        case core, fairings, capsule
    }
}

/*
 "core":false,
 "side_core1":false,
 "side_core2":false,
 "fairings":false,
 "capsule":false
 */
