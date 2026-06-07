//
//  ContentView.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 7/6/2026.
//

import SwiftUI

struct ContentView: View {
  @State private var message: String = "Roll the dice!"
  
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
            
            HStack {
              Button {
                dieRoll(sides: 4)
              } label: {
                Text("4 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
              

              Button {
                dieRoll(sides: 6)
              } label: {
                Text("6 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
              
              Button {
                dieRoll(sides: 8)
              } label: {
                Text("8 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
            }
            
            HStack {
              Button {
                dieRoll(sides: 10)
              } label: {
                Text("10 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
              

              Button {
                dieRoll(sides: 12)
              } label: {
                Text("12 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
              
              Button {
                dieRoll(sides: 20)
              } label: {
                Text("20 Sided")
              }
              .buttonStyle(.glassProminent)
              .font(.title2)
              .tint(.red)
            }

            Button {
              dieRoll(sides: 100)
            } label: {
              Text("100 Sided")
            }
            .buttonStyle(.glassProminent)
            .font(.title2)
            .tint(.red)
            
          }
          .padding()
        }
        
      func dieRoll(sides: Int) {
        message = "You rolled a \(Int.random(in: 1...sides)) on a \(sides) sided die"
        }
}

#Preview {
    ContentView()
}
