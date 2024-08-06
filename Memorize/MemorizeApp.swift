//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Michael Kim on 8/2/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
} 
