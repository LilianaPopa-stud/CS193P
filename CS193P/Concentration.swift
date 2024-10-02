//
//  Concentration.swift
//  CS193P
//
//  Created by Liliana Popa on 01.10.2024.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var indexOftheOneAndOnlyFaceUpCard: Int?
    
    var score = 0
    
    var flipCount = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount+=1
            if let matchIndex = indexOftheOneAndOnlyFaceUpCard,
               matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score+=2
                } else {
                    if cards[index].seen { score-=1 }
                    else { cards[index].seen =  true }
                    
                    if cards[matchIndex].seen { score-=1 }
                    else { cards[matchIndex].seen = true }
                }
                
                cards[index].isFaceUp = true
                indexOftheOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOftheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
    
    func shuffleTheCards(){
        // TODO: shuffle the cards
        for index in cards.indices {
            var randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            var auxCard = cards[randomIndex]
            cards[randomIndex] = cards[index]
            cards[index] = auxCard
            
            
            
        }
    }
    
}
