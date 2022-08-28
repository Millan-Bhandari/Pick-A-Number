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
    @State var reset = ""
    @State var isreset = false
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
                reset = "Play Again"
                determineWinner()
            }
            Button("\(reset)") {
                Reset()
            }
            .padding()
            Text("\(win)")
        }
        .onAppear {
            overlyComplicated = ""
            guess = ""
            reset = ""
        }
        .onChange(of: yourNum) { newValue in
            if let yournum1 = Int(yourNum) {
                if yournum1 > 0 {
                    guess = "Guess"
                }
            }
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
    func Reset() {
        text1 = ""
        text2 = ""
        yourNum = ""
        randomNum = 0
        overlyComplicated = ""
        win = ""
        guess = ""
        reset = ""
        isreset = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.black)
      Spacer()
    }
    .padding()
    .frame(width: 50, height: 25, alignment: .center)
    .background(Color.yellow.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}
