//
//  Concentration.swift
//  Concentrations
//
//  Created by Денис on 14/01/2019.
//  Copyright © 2019 Dev74. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isFaceUp {
            if let machIndex = indexOfOneAndOnlyFaceUpCard, machIndex != index {
                //check if cards mach
                if cards[machIndex].identifier == cards[index].identifier {
                    cards[machIndex].isMached = true
                    cards[index].isMached = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPeirstOfCards: Int) {
        for _ in 1...numberOfPeirstOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Suffle the cards
    }
}
