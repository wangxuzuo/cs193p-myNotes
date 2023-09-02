//
//  ContentView.swift
//  Memorize
//
//  Created by 王虚左 on 2023/8/31.
//

import SwiftUI

struct ContentView: View {

    let emojis: Array<String> = ["👻","👽","☠️","🫶","🫶","👻","👽","☠️","☠️","🫶","🫶","👻","👽"]
    
    @State var cardCount :Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardAdjuster
            }
        
        .foregroundColor(.orange)
        .padding()
        //macmini
    }
    var cards :some View{
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(0..<cardCount,id:\.self){ index in
                CardView(content:emojis[index],isFaceUp: true)
                    .aspectRatio(2/3,contentMode: .fit)
                
                                            }
            }
        
        
    }
    var cardAdjuster: some View{
        return HStack{
            cardAdder
            
            Spacer()
            cardRmover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjuster(by offset: Int, symbol:String)-> some View{
        Button(action: {
           cardCount += offset
        },label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.fill.badge.plus")
    }
    var cardRmover : some View{
        cardCountAdjuster(by: -1, symbol: "minus.rectangle.fill")
    }
}



struct CardView:View{

    let content:String
    @State var isFaceUp: Bool = true
    
    var body :some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.foregroundColor(.blue)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)


            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
         }
        .onTapGesture(count:1){
            isFaceUp.toggle()
            
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
