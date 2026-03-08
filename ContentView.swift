//
//  ContentView.swift
//  UA2-2.4-Elmehdi
//
//  Created by user279285 on 3/8/26.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to my app" 
    
    var body: some View {
        VStack {
            Spacer()
            Text("Elmehdi's app")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(colors[colorIndex])
            
            Spacer()
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("Enter text here:", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(0..<colornames.count, id: \.self) { i in
                    Text(colornames[i])
                        .foregroundColor(colors[i])
                }
            }
            .pickerStyle(.wheel)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
