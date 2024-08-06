//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Michael Kim on 8/3/24.
//

import Foundation



struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
        
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter { index in cards[index].isFaceUp}.only }
        set { return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)} }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].IsMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].IsMatched = true
                        cards[potentialMatchIndex].IsMatched = true
                    }
                    
                    
                } else {
                    
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                
                cards[chosenIndex].isFaceUp = true
            }
            
        }
        
    }
    
//    private func index(of card: Card) -> Int? {
//        for index in cards.indices {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        
        
        
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.IsMatched == rhs.IsMatched &&
//            lhs.content == rhs.content
//        }
        
        var isFaceUp = false
        var IsMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down")\(IsMatched ? "matched" : "")"
        }
    }
}


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
