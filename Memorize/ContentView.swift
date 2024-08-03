//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🐶",  "🐱", "🐼", "🐯"]
    
    var body: some View {
        HStack() {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.indigo)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack() {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
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
