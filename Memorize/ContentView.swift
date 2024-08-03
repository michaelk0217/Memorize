//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🐶", "🐱", "🐼", "🐯", "🦁", "🐧", "🐮", "🐸", "🐵", "🐔", "🐝", "🦄"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack(){
            HStack() {
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(content: emojis[index])
                }
                
            }
            .foregroundColor(.green)
            
            
            HStack() {
                Button(action: {
                    if cardCount > 1{
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "minus.square.fill")
                })
                Spacer()
                Button(action: {
                    if cardCount < emojis.count{
                        cardCount += 1
                    }
                    
                }, label: {
                    Image(systemName: "plus.square.fill")
                })
                
            }
            .imageScale(.large)
            .font(.largeTitle)
            
        }.padding()
        
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack() {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else{
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
