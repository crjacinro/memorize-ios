//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Serge Villasica on 11/10/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
