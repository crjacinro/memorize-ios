//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Serge Villasica on 18/10/21.
//

import Foundation

let vehiclesEmojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
let natureEmojis = ["🐻", "🦖","🍀","🌧","🐓","🦚","🌱","🦢","🌼","🌷",]
let countryEmojis = ["🇻🇬", "🇨🇦","🇵🇭","🇧🇷","🇧🇬","🇨🇴","🇺🇳","🇦🇿","🇧🇩","🇸🇬",]

var emojis: [String] = vehiclesEmojis
var emojiCount = Int.random(in: 8...vehiclesEmojis.count)

class EmojiMemoryGameViewModel{
    
    static let vehiclesEmojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
    
    private var model: MemoryGameModel<String> = MemoryGameModel<String>(numberOfPairsOfCards: 4) { index in
        vehiclesEmojis[index]
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGameModel<String>.Card){
        model.choose(card)
    }
}
