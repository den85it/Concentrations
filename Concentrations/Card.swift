//
//  Card.swift
//  Concentrations
//
//  Created by Денис on 14/01/2019.
//  Copyright © 2019 Dev74. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMached = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
