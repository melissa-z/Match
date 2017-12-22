//
//  Card.swift
//  Match
//
//  Created by Melissa Zhang on 12/19/17.
//  Copyright © 2017 Melissa Zhang. All rights reserved.
//

import Foundation

struct Card {
    var faceUp = false
    var isMatched = false
    var identifier: Int
    
    static var makeIdentifier = 0
    
    static func getIdentifier() -> Int {
        makeIdentifier += 1
        return makeIdentifier
    }
    
    init() {
        self.identifier = Card.getIdentifier()
    }
}
