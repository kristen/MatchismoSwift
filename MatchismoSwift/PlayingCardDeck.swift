//
//  PlayingCardDeck.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import Foundation

class PlayingCardDeck: Deck {
    override init() {
        super.init()
        for suit in PlayingCard.validSuits() {
            for rank in 1...PlayingCard.maxRank() {
                addCard(PlayingCard(rank: rank, suit: suit))
            }
        }
    }
}