//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 20/10/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  
  
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
          
          VStack {
            HStack {
              Button {
                rollDie(sides: 4)
              } label: {
                Text ("4-Sided")
              }

              Spacer()
              
              Button {
                rollDie(sides: 6)
              } label: {
                Text ("6-Sided")
              }
              
              Spacer()
              
              Button {
                rollDie(sides: 8)
              } label: {
                Text ("8-Sided")
              }
            }
            
            
            HStack {
              Button {
                rollDie(sides: 10)
              } label: {
                Text ("10-Sided")
              }

              Spacer()
              
              Button {
                rollDie(sides: 12)
              } label: {
                Text ("12-Sided")
              }
              
              Spacer()
              
              Button {
                rollDie(sides: 20)
              } label: {
                Text ("20-Sided")
              }
            }
            
            Button {
              rollDie(sides: 100)
            } label: {
              Text ("100-Sided")
            }
          }
          .buttonStyle(.glassProminent)
          .tint(.red)
          .font(.title2)
          
        }
        .padding()
    }
  
  func rollDie (sides: Int) {
    let result = Int.random(in: 1..<sides)
    
    message = ("You rolled a \(result) on a \(sides) sided die.")
  }
}

#Preview {
    ContentView()
}
