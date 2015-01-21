//
//  ViewController.swift
//  MatchismoSwift
//
//  Created by Kristen on 1/20/15.
//  Copyright (c) 2015 Kristen Sundquist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flipsLabel: UILabel!
    lazy var flipCount = 0
    lazy var deck = PlayingCardDeck()

    @IBAction func touchCardButton(sender: UIButton) {
        if sender.currentTitle == nil || sender.currentTitle?.isEmpty == true {
            sender.setBackgroundImage(UIImage(named: "cardfront"), forState: .Normal)
            
            if let randomCard = deck.drawRandomCard() {
                sender.setTitle(randomCard.contents, forState: .Normal)
            }
            
            
        } else {
            sender.setBackgroundImage(UIImage(named: "cardback"), forState: .Normal)
            sender.setTitle("", forState: .Normal)
        }
        flipCount++
        flipsLabel.text = "Flips: \(flipCount)"
    }
}

