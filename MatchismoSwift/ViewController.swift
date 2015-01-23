//
//  ViewController.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game: CardMatchingGame = {
        [unowned self] in
        return CardMatchingGame(cardCount: self.cardButtons.count, usingDeck: PlayingCardDeck())
    }()

    @IBAction func touchCardButton(sender: UIButton) {
        let index = (cardButtons as NSArray).indexOfObject(sender)
        game.chooseCardAtIndex(index)
        updateUI()
    }
    
    @IBAction func touchDealNewGameButton() {
        game = CardMatchingGame(cardCount: self.cardButtons.count, usingDeck: PlayingCardDeck())
        updateUI()
    }
    
    func updateUI() {
        for cardButton in cardButtons {
            let index = (cardButtons as NSArray).indexOfObject(cardButton)
            if let card = game.cardAtIndex(index) {
                cardButton.setTitle(titleForCard(card), forState: .Normal)
                cardButton.setBackgroundImage(backgroundImageForCard(card), forState: .Normal)
                cardButton.enabled = !card.matched
            }
            scoreLabel.text = "Score: \(game.score)"
        }
    }
    
    func titleForCard(card: Card) -> String {
        return card.chosen ? card.contents : ""
    }
    
    func backgroundImageForCard(card: Card) -> UIImage {
        return UIImage(named: card.chosen ? "cardfront": "cardback")!
    }
}