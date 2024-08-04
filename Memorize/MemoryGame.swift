//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Michael Kim on 8/3/24.
//

import Foundation



struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsofCards: Int) {
        cards = Array<Card>()
    }
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var IsMatched: Bool
        var content: CardContent
    }
}
