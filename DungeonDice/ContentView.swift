//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 8/2/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  private let diceTypes: [Int] = [4, 6, 8, 10, 12, 20]
  
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
      
      Group {
        ForEach(diceTypes, id: \.self) { diceType in
          Button {// 4 sided die
            rollDie(sides: diceType)
          } label: {
            Text("\(diceType)-Sided")
          }
        }
      }
      .font(.title2)
      .buttonStyle(.glassProminent)
      .foregroundStyle(.white)
      .tint(.red)



      //          VStack {
      //            HStack {
      //              Button {// 4 sided die
      //                rollDie(sides: 4)
      //              } label: {
      //                Text("4-Sided")
      //              }
      //
      //              Spacer()
      //
      //              Button {// 6 sided die
      //                rollDie(sides: 6)
      //              } label: {
      //                Text("6-Sided")
      //              }
      //
      //              Spacer()
      //
      //              Button {// 8 sided die
      //                rollDie(sides: 8)
      //              } label: {
      //                Text("8-Sided")
      //              }
      //
      //            }
      //            HStack {
      //              Button {// 10 sided die
      //                rollDie(sides: 10)
      //              } label: {
      //                Text("10-Sided")
      //              }
      //
      //              Spacer()
      //
      //              Button {// 12 sided die
      //                rollDie(sides: 12)
      //              } label: {
      //                Text("12-Sided")
      //              }
      //
      //              Spacer()
      //
      //              Button {// 20 sided die
      //                rollDie(sides: 20)
      //              } label: {
      //                Text("20-Sided")
      //              }
      //
      //            }
      //            HStack {
      //              Button {// 100 sided die
      //                rollDie(sides: 100)
      //              } label: {
      //                Text("100-Sided")
      //              }
      //
      //            }
      //          }
      //          .font(.title2)
      //          .buttonStyle(.glassProminent)
      //          .foregroundStyle(.white)
      //          .tint(.red)
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
