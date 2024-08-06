//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
        
    }
    
    private var cards: some View {
        
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
           
            CardView(card)
                .aspectRatio(aspectRatio, contentMode : .fit)
                .padding(4)
                .onTapGesture{
                    viewModel.choose(card)
                }
                   
            
        }
        .foregroundColor(.green)
        
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack() {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0:1)
        }
        .opacity(card.isFaceUp || !card.IsMatched ? 1 : 0)
    }
}


struct EmojiMemryGameView_Previews: PreviewProvider {
    static var previews: some View{
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
