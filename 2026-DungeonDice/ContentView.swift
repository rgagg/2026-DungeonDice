//
//  ContentView.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 7/6/2026.
//

import SwiftUI

struct ContentView: View {
  @State private var message: String = "Roll a die!"
  private let diceTypes: [Int] = [4, 6, 8, 10, 12, 20, 100]
  
  var body: some View {
    VStack {
      Text("Dungeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Text(message)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Spacer()
      
      ForEach(diceTypes, id: \.self) { diceType in
        Button {
          dieRoll(sides: diceType)
        } label: {
          Text("\(diceType)-Sided")
        }
        .buttonStyle(.glassProminent)
        .font(.title2)
        .tint(.red)
      }
    }
  }
  
  func dieRoll(sides: Int) {
    let result = Int.random(in: 1...sides)
    message = "You rolled a \(result) on a \(sides) sided die"
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
