//
//  FirstStage.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct FirstStage: Decodable {
    var cores: [Core]?
    
    private enum CodeingKeys: String, CodingKey {
        case cores
    }
}
