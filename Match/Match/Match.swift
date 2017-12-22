//
//  Match.swift
//  Match
//
//  Created by Melissa Zhang on 12/19/17.
//  Copyright © 2017 Melissa Zhang. All rights reserved.
//

import Foundation

class Match
{
    var cards = [Card]()
    var indexOnlyOneUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOnlyOneUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                }
                cards[index].faceUp = true
                indexOnlyOneUp = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].faceUp = false
                }
                cards[index].faceUp = true
                indexOnlyOneUp = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
}
