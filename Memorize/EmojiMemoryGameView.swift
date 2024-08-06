//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
        
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards){ card in
                
                CardView(card)
                    .aspectRatio(2/3, contentMode : .fit)
                    .padding(4)
                    .onTapGesture{
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.green)
    }
    
//    var cardCountAdjusters: some View {
//        HStack() {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            
//            cardCount += offset
//            
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "minus.square.fill")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: 1, symbol: "plus.square.fill")
//    }
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
