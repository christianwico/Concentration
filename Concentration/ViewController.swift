//
//  ViewController.swift
//  Concentration
//
//  Created by Christian Neil Anthony S. Wico on 22/12/2017.
//  Copyright © 2017 Staffel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var emojiChoices = ["🎄", "☃️", "🤶", "🎅", "🇨🇽", "❄️", "⛄️", "🎁", "🌟", "⭐️", "✞"]
    
    lazy var game = Concentration(pairsOfCards: (cardButtons.count + 1) / 2)
    var emoji = [Int: String]()
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("not in array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emoji[card.identifier] = emojiChoices.remove(at: randIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

