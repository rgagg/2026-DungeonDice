//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 20/10/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  
  private var diceTypes: [Int] = [4, 6, 8, 10, 12, 20, 100]
  
  var body: some View {
    VStack {
      Text("Dungeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Text ("\(message)")
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        ForEach(diceTypes, id: \.self) { diceType in
          Button {
            rollDie(sides: diceType)
          } label: {
            Text ("\(diceType)-Sided")
          }
        }
        .font(.title2)
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
        .buttonStyle(.glassProminent)
        .tint(.red)
      }
      
    }
    .padding()
  }
  
  func rollDie (sides: Int) {
    let result = Int.random(in: 1..<sides)
    
    message = ("You rolled a \(result) on a \(sides) sided die.")
  }
}





#Preview("Light Mode") {
  ContentView()
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
  ContentView()
    .preferredColorScheme(.dark)
}
