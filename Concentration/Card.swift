//
//  Card.swift
//  Concentration
//
//  Created by Christian Neil Anthony S. Wico on 22/12/2017.
//  Copyright © 2017 Staffel. All rights reserved.
//

import Foundation

struct Card {
    static var idFactory = 0
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static func getUniqueId() -> Int {
        idFactory += 1
        
        return idFactory
    }
    
    init() {
        identifier = Card.getUniqueId()
    }
}
