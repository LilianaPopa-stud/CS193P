//
//  ViewController.swift
//  CS193P
//
//  Created by Liliana Popa on 01.10.2024.
//

import UIKit

class ViewController: UIViewController {
    var emojiChoices = [["🍏","🍐","🍊","🥥","🍒","🫐"],
                        ["a","b","c","d","e","f"],
                        ["aa","bb","cc","dd","ee","ff"],
                        ["q","w","y","u","t","z"]]
    
    lazy  var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    lazy var theme = Theme(emojiChoices: emojiChoices)
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGameButton(_ sender: UIButton) {
        endPreviousGame()
        self.theme = Theme(emojiChoices: emojiChoices)
        self.game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        scoreLabel.text = "Score: \(game.score)"
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            scoreLabel.text = "Score: \(game.score)"
            flipCountLabel.text = "Flips: \(game.flipCount)"
            
        }
        else {
            print("chosen card was not in the cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    func endPreviousGame(){
        Card.identifierFactory = 0
        for index in cardButtons.indices {
            let button = cardButtons[index]
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
        emoji = [:]
    }
   
    var emoji = [Int:String]() // Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil {
            if theme.emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(theme.emojiChoices.count)))
                emoji[card.identifier] = theme.emojiChoices.remove(at: randomIndex)
            }
        }
        /* if emoji[card.identifier] != nil {
         emoji[card.identifier]!
         }
         return "?"
         */
        return emoji[card.identifier] ?? "?"
    }
}

