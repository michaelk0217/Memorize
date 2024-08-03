//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack() {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            
        }
        .foregroundColor(.indigo)
        .padding()
        
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack() {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text("🐶").font(.largeTitle)
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
