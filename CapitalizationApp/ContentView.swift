//
//  ContentView.swift
//  CapitalizationApp
//
//  Created by Rafael Siqueira Ramos on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var decorationIndex = -1

    var body: some View {
        VStack {
            
            DecoratedText(text: userText, decorationIndex: decorationIndex)
                .font(.largeTitle)
            
            TextField("Enter text here...", text: $userText)
                .padding()
            
            HStack {
                Button(action: {
                    decorationIndex = 0
                }) {
                    RoundedButton(title: "CAPS", color: .blue)
                }
                Button(action: {
                    decorationIndex = 1
                }) {
                    RoundedButton(title: "First Letter", color: .green)
                }
                Button(action: {
                    decorationIndex = 2
                }) {
                    RoundedButton(title: "lowercase", color: .red)
                }
            }
            .padding()
        }
    }
}

struct DecoratedText: View {
    var text: String
    var decorationIndex: Int
    
    var body: some View {
        switch decorationIndex {
        case 0:
            Text(text.uppercased())
                .padding()
        case 1:
            Text(text.capitalized)
                .padding()
        case 2:
            Text(text.lowercased())
                .padding()
        default:
            Text(text)
                .padding()
        }
    }
}

struct RoundedButton: View {
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .padding(10)
            .frame(maxWidth: .infinity)
            .font(.body)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
