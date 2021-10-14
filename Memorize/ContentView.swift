//
//  ContentView.swift
//  Memorize
//
//  Created by Serge Villasica on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
    @State var emojiCount = 5
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                removeBtn
                Spacer()
                addBtn
            }
        }
        .padding(.horizontal)
    }
    
    var removeBtn: some View{
        Button {
           if emojiCount > 1 {
               emojiCount -= 1
           }
       } label: {
           Image(systemName: "minus.circle").font(.largeTitle)
       }
    }
    
    var addBtn : some View {
        Button{
           if emojiCount < emojis.count {
               emojiCount += 1
           }
       } label: {
           Image(systemName: "plus.circle").font(.largeTitle)
       }
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
