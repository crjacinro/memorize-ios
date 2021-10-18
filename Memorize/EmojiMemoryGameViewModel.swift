//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Serge Villasica on 18/10/21.
//

import Foundation

class EmojiMemoryGameViewModel{
    
    static let vehiclesEmojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
    
    private var model: MemoryGameModel<String> = MemoryGameModel<String>(numberOfPairsOfCards: 4) { index in
        vehiclesEmojis[index]
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
}
