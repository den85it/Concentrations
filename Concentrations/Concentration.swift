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
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
            
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not the cards")
        if !cards[index].isFaceUp {
            if let machIndex = indexOfOneAndOnlyFaceUpCard, machIndex != index {
                //check if cards mach
                if cards[machIndex].identifier == cards[index].identifier {
                    cards[machIndex].isMached = true
                    cards[index].isMached = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPeirstOfCards: Int) {
        assert(numberOfPeirstOfCards > 0, "Concentration.init(at: \(numberOfPeirstOfCards)): you must have at least one pair of cards")
        for _ in 0..<numberOfPeirstOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Suffle the cards
    }
}
