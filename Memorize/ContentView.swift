//
//  ContentView.swift
//  Memorize
//
//  Created by 王虚左 on 2023/8/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView:View{
    var isFaceUp: Bool = false
    
    var body :some View{
        if isFaceUp {
            ZStack(content:{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            })
        }else{
            ZStack(content:{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
              
            })
        }
        
    }
}
