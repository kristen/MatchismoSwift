//
//  CardMatchingGame.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/21/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import Foundation

class CardMatchingGame {
    lazy var score = 0
    lazy var cards: [Card] = []
    var cardsToMatch = 2
    let mismatchPenalty = 2
    let matchBonus = 4
    let costToChoose = 1
    
    init(cardCount count: Int, usingDeck deck: Deck) {
        for _ in 0..<count {
            if let card = deck.drawRandomCard() {
                cards.append(card)
            } else {
                break
            }
        }
    }
    
    func cardAtIndex(index: Int) -> Card? {
        return (index < cards.count) ? cards[index] : nil
    }
    
    func chooseCardAtIndex(index: Int) {
        if let card = cardAtIndex(index) {
            if !card.matched {
                if card.chosen {
                    card.chosen = false
                } else {
                    let otherChosenCards = cards.filter { $0.chosen && !$0.matched }
                    if otherChosenCards.count == cardsToMatch - 1 {
                        let matchScore = card.match(otherChosenCards)
                        if matchScore > 0 {
                            score += matchScore * matchBonus
                            card.matched = true
                            otherChosenCards.map { $0.matched = true }
                        } else {
                            score -= mismatchPenalty
                            otherChosenCards.map { $0.chosen = false }
                        }
                    }
                    score -= costToChoose
                    card.chosen = true // wait to set chosen until after filter other chosen cards
                }
            }
        }
    }
}