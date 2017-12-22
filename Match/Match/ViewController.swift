//
//  ViewController.swift
//  Match
//
//  Created by Melissa Zhang on 12/19/17.
//  Copyright © 2017 Melissa Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Match(numberOfPairs: cardButtons.count/2)
    
    var moves = 0 {didSet{ movesLabel.text = "Moves: \(moves)"}}

    @IBOutlet weak var movesLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func pressButton(_ sender: UIButton) {
        moves += 1
        let cardNumber = cardButtons.index(of: sender)!
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.faceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "🍭", "☠", "🍬", "🗡"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count>0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

