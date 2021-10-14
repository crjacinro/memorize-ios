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
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
                removeBtn
                Spacer()
                addBtn
            }
            .font(.largeTitle)
            .padding(.horizontal)
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
    
    var addBtn: some View {
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
                cardShape.strokeBorder(lineWidth: 3)
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
