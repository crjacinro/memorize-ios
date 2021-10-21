//
//  ContentView.swift
//  Memorize
//
//  Created by Serge Villasica on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.themeName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                            .foregroundColor(viewModel.themeColor)
                    }
                }
            }
            .padding()
            Button("New Game", action: {
                viewModel.startNewGame()
            }).font(.title)
        }
    }
}

struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched {
                cardShape.opacity(0.3)
            }else{
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
    }
}

let game = EmojiMemoryGameViewModel()
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: game)
    }
}
