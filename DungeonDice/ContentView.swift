//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 8/2/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  private let diceTypes: [Int] = [4, 6, 8, 10, 12, 20, 100]
  
  var body: some View {
    VStack {
      Text("Dingeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Text(message)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        ForEach(diceTypes, id: \.self) { diceType in
          Button {
            rollDie(sides: diceType)
          } label: {
            Text("\(diceType)-Sided")
          }
          .font(.title2)
          .lineLimit(1)
          .fixedSize(horizontal: true, vertical: true)
          .buttonStyle(.glassProminent)
          .tint(.red)
        }
      }


      
    }
    .padding()
  }
  
  // MARK: Functions
  
  func rollDie(sides: Int) {
    let roll = Int.random(in: 1...sides)
    message = "You Rolled a \(roll) on a \(sides)-sided die."
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
