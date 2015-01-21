//
//  Card.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import Foundation

class Card {
    let contents: String
    var matched: Bool
    var chosen: Bool
    
    init(contents: String) {
        self.contents = contents
        self.matched = false
        self.chosen = false
    }
    
    func match(otherCards: [Card]) -> Int {
        var score = 0
        for card in otherCards {
            if card.contents == contents {
                score = 1
            }
        }
        return score
    }
}