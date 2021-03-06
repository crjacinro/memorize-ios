//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Serge Villasica on 18/10/21.
//

import Foundation
import SwiftUI

private let themesList = [
    Theme(name: "Vehicle", cards: ["ðŧ", "ð","ð","âïļ","ðĒ","ð","ð","ð","ð","ðĐ",], color: ThemeColor.Red),
    Theme(name: "Nature", cards: ["ðŧ", "ðĶ","ð","ð§","ð","ðĶ","ðą","ðĶĒ","ðž","ð·",],color: ThemeColor.Orange),
    Theme(name: "Country", cards: ["ðŧðŽ", "ðĻðĶ","ðĩð­","ð§ð·","ð§ðŽ","ðĻðī","ðšðģ","ðĶðŋ","ð§ðĐ","ðļðŽ",], color: ThemeColor.Blue),
    Theme(name: "Sports", cards: ["ð", "ðū","ð","ð","ðą","ðĨ","ðââïļ","â―ïļ","âģïļ","ðĪŋ",], color: ThemeColor.Pink),
    Theme(name: "Drinks", cards: ["ðš", "ðĩ","âïļ","ðđ","ð§","ð§","ðķ","ðĨ","ð§","ðĨĪ",], color: ThemeColor.Violet),
    Theme(name: "Food", cards: ["ð", "ðĨŠ","ð","ð­","ð","ð","ðĨĻ","ðĨĐ","ðŪ","ðĨ",], color: ThemeColor.Green)
]

private func createTheme() -> Theme {
    let randomThemeIndex = Int.random(in: 0..<themesList.count)
    var randomTheme = themesList[randomThemeIndex]
    randomTheme.cards.shuffle()
    
    return randomTheme
}

private func createMemoryGame(_ theme: Theme) -> MemoryGameModel<String> {
    let desiredNumberOfPairs = 999
    let maximumPairs = desiredNumberOfPairs > theme.cards.count ? theme.cards.count : desiredNumberOfPairs
    
     return MemoryGameModel<String>(numberOfPairsOfCards: maximumPairs) { index in
        theme.cards[index]
    }
}




class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGameModel<String>
    @Published private var theme: Theme
    
    typealias Card = MemoryGameModel<String>.Card
    
    var cards: [Card] { model.cards }
    
    var score: Int { model.score }
    
    var themeName: String { theme.name }
    
    var themeColor: Color {
        let themeColor = theme.color
        
        switch themeColor {
            case .Red : return Color.red
            case .Blue : return Color.blue
            case .Green : return Color.green
            case .Orange : return Color.orange
            case .Violet : return Color.purple
            case .Pink : return Color.pink
        }
    }
    
    init() {
        let theme = createTheme()
        
        self.theme = theme
        self.model = createMemoryGame(theme)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card){
        model.choose(card)
    }
    
    func startNewGame(){
        theme = createTheme()
        model = createMemoryGame(theme)
    }
}
