//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Michael Kim on 8/3/24.
//

import Foundation



struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp = true
        var IsMatched = false
        let content: CardContent
    }
}
