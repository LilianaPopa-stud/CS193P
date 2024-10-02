//
//  Theme.swift
//  CS193P
//
//  Created by Liliana Popa on 02.10.2024.
//

import Foundation

struct Theme {
    var emojiChoices: [String]
 
    
    init(emojiChoices: [[String]]) {
       // random
        var randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
        self.emojiChoices = emojiChoices[randomIndex]
    }
    
}
