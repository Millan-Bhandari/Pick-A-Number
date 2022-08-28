//
//  ContentView.swift
//  Pick A Number
//
//  Created by Millan Bhandari on 8/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var randomNum = 0
    @State private var yourNum = ""
    @State private var overlyComplicated = ""
    @State private var win = ""
    @State private var guess = ""
    var body: some View {
        VStack{
        Text("Pick A Number")
            .fontWeight(.bold)
            .padding()
            .font(.title)
            HStack{
                Text("Between")
                TextField("Number", text: $text1)
                    .keyboardType(.numberPad)
                    .frame(width: 65, height: 20, alignment: .center)
                Text("And")
                TextField("Number", text: $text2)
                    .keyboardType(.numberPad)
                    .frame(width: 65, height: 20, alignment: .center)
            }
            Button("Submit") {
                Random()
                overlyComplicated = "Guess the number"
            }
            TextField("\(overlyComplicated)", text: $yourNum)
                .padding()
            Button("\(guess)") {
                determineWinner()
            }
            Text("\(win)")
        }
        .onAppear {
            overlyComplicated = ""
            guess = ""
        }
        .onChange(of: yourNum) { newValue in
            guess = "Guess"
        }
    }
    func Random() {
        if let num1 = Int(text1) {
            if let num2 = Int(text2) {
                randomNum = Int.random(in: num1...num2)
            }
        }
    }
    func determineWinner() {
        if yourNum == "\(randomNum)" {
            win = "you win"
        }
        if yourNum != "\(randomNum)" {
            win = "Welp u lose. the number was \(randomNum)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
