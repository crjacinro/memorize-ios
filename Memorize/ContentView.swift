//
//  ContentView.swift
//  Memorize
//
//  Created by Serge Villasica on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
    let emojiCount = 5
    
    var body: some View {
        HStack{
            ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                CardView(content: emoji)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var content = ""
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
