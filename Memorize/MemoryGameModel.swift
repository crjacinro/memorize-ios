//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Serge Villasica on 18/10/21.
//

import Foundation

struct MemoryGameModel<CardContent>{
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        print("Hello")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1 ))
        }
    }
      
    struct Card : Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
