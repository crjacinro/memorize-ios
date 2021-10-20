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

class EmojiMemoryGameViewModel: ObservableObject {
    
    static let vehiclesEmojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairsOfCards: 4) { index in
            vehiclesEmojis[index]
        }
    }
    
    @Published private var model: MemoryGameModel<String> = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGameModel<String>.Card){
        model.choose(card)
    }
}
