//
//  PlayingCard.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import Foundation

class PlayingCard: Card {
    let rank: Int
    let suit: String
    
    init(rank: Int, suit: String) {
        self.rank = rank
        
        if contains(PlayingCard.validSuits(), suit) {
            self.suit = suit
        } else {
            self.suit = "?"
        }
        
        super.init(contents: "\(PlayingCard.rankStrings()[rank]) \(suit)")
    }
    
    private class func rankStrings() -> [String] {
        return ["?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    class func maxRank() -> Int {
        return PlayingCard.rankStrings().count - 1
    }
    
    class func validSuits() -> [String] {
        return ["♥︎", "♦︎", "♠︎", "♣︎"]
    }
    
    override func match(otherCards: [Card]) -> Int {
        var score = 0
        if otherCards.count == 1 {
            let otherCard = otherCards.first as PlayingCard
            if otherCard.rank == rank {
                score = 4
            } else if otherCard.suit == suit {
                score = 1
            }
        }
        return score
    }
}