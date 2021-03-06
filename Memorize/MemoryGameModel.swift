//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Serge Villasica on 18/10/21.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var score: Int = 0

    private var onlyFaceUpCardIndex: Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = onlyFaceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    score += 2
                } else {
                    if cards[chosenIndex].isSeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isSeen {
                        score -= 1
                    }
                }
                onlyFaceUpCardIndex = nil
            }else{
                for index in cards.indices{
                    if(cards[index].isFaceUp == true){
                        cards[index].isSeen = true
                    }
                    
                    cards[index].isFaceUp = false
                }
                onlyFaceUpCardIndex = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        self.cards = []
      
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            self.cards.append(Card(content: content, id: pairIndex*2))
            self.cards.append(Card(content: content, id: pairIndex*2 + 1 ))
        }
        
        self.cards.shuffle()
    }
      
    struct Card : Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isSeen = false
        let content: CardContent
        let id: Int
    }
}

struct Theme: Identifiable {
    let id = Int.random(in: 0...999)
    let name: String
    var cards: [String]
    let color: ThemeColor
}

enum ThemeColor {
    case Red, Blue,Green, Violet, Orange, Pink
}

