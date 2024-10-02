//
//  Card.swift
//  CS193P
//
//  Created by Liliana Popa on 01.10.2024.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var seen = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier =  Card.getUniqueIdentifier()
    }
}
