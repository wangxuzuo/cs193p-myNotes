//
//  ContentView.swift
//  Memorize
//
//  Created by 王虚左 on 2023/8/31.
//

import SwiftUI

struct ContentView: View {

    let emojis: Array<String> = ["👻","👽","☠️","🫶"]
    var body: some View {
        HStack{
            ForEach(emojis.indices,id:\.self){ index in
                CardView(content:emojis[index],isFaceUp: true)
                
            }
            
//            CardView(content:emojis[0],isFaceUp: true)
//            CardView(content:emojis[1])
//            CardView(content:emojis[2],isFaceUp: true)
//            CardView(content:emojis[3],isFaceUp: true)

        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView:View{

    let content:String
    @State var isFaceUp: Bool = false
    
    var body :some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.blue)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
                
            }else{
                
                    base.foregroundColor(.orange)
                    base.strokeBorder(lineWidth: 2)
                    
                
            }
            
         }
        .onTapGesture(count:2){
            isFaceUp.toggle()
            
        }

    }
}
