//
//  ContentView.swift
//  Trip Planner
//
//  Created by Julia Woeste on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State var title: String = ""
    var body: some View {
        VStack{
            Text("Trip Planner")
                .position(CGPoint(x: 200.0, y: 40.0))
                .font(.system(size: 50, weight: .semibold, design: .serif))
                .foregroundColor(.pink)
                
            Text(title)
            Button("Click Me", action: {
                //execute action
                //print("Hello World")
                self.title = "Hello World"
                
            })
            .buttonStyle(.borderedProminent)
            .tint(.gray)
            .font(Font.system(size: 30))
            .buttonBorderShape(.roundedRectangle)
            .position(CGPoint(x: 200.0, y: 10.0))
            .padding(.top)
        }
        
        /*TabView{
            Text("Hello")
                .tabItem { Text("Hi") }
            Text("Bye")
                .tabItem { Text("By") }
        }*/
    }
}

    
#Preview {
    ContentView()
}
