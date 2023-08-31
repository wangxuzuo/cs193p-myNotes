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
    @State var isFaceUp: Bool = false
    
    var body :some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.blue)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
                
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
