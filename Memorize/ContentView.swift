//
//  ContentView.swift
//  Memorize
//
//  Created by Serge Villasica on 11/10/21.
//

import SwiftUI

let vehiclesEmojis = ["🛻", "🚛","🚖","✈️","🚢","🚝","🚑","🚚","🚔","🛩",]
let natureEmojis = ["🐻", "🦖","🍀","🌧","🐓","🦚","🌱","🦢","🌼","🌷",]
let countryEmojis = ["🇻🇬", "🇨🇦","🇵🇭","🇧🇷","🇧🇬","🇨🇴","🇺🇳","🇦🇿","🇧🇩","🇸🇬",]

struct ContentView: View {
    @State var emojis: [String] = vehiclesEmojis
    @State var emojiCount = Int.random(in: 8...vehiclesEmojis.count)
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.title)
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
                Spacer()
                Button(action: {
                    emojis = vehiclesEmojis.shuffled()
                    emojiCount = Int.random(in: 8...vehiclesEmojis.count)
                }, label: {
                    VStack{
                        Image(systemName: "car.fill")
                        Text("Vehicles")
                            .font(.footnote)
                    }
                })
                .padding(.all)
                Button(action: {
                    emojis = natureEmojis.shuffled()
                    emojiCount = Int.random(in: 8...vehiclesEmojis.count)
                }, label: {
                    VStack{
                        Image(systemName: "leaf.fill")
                        Text("Nature ")
                            .font(.footnote)
                    }
                })
                .padding(.all)
                Button(action: {
                    emojis = countryEmojis.shuffled()
                    emojiCount = Int.random(in: 8...vehiclesEmojis.count)
                }, label: {
                    VStack{
                        Image(systemName: "flag.fill")
                        Text("Countries")
                            .font(.footnote)
                    }
                })
                .padding(.all)
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
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
