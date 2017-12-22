//
//  Concentration.swift
//  Concentration
//
//  Created by Christian Neil Anthony S. Wico on 22/12/2017.
//  Copyright © 2017 Staffel. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var faceUpIndex: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = faceUpIndex, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                faceUpIndex = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                faceUpIndex = index
            }
        }
    }
    
    init(pairsOfCards: Int) {
        for _ in 1...pairsOfCards {
            let card = Card()
            
            cards += [card, card]
        }
        
        // TODO: Shuffle.
    }
}
