//
//  Deck.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import Foundation

class Deck {
    lazy var cards: [Card] = []
    
    func addCard(card: Card, atTop: Bool) {
        if (atTop) {
            cards.insert(card, atIndex: 0)
        } else {
            cards.append(card)
        }
    }
    
    func addCard(card: Card) {
        addCard(card, atTop: false)
    }
    
    func drawRandomCard() -> Card? {
        var randomCard: Card? = nil
        if cards.count > 0 {
            let index = Int(arc4random()) % cards.count
            randomCard = cards.removeAtIndex(index)
        }
        return randomCard
    }
}