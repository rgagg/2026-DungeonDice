//
//  ContentView.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 7/6/2026.
//

import SwiftUI

struct ContentView: View {
  @State private var message: String = "Roll a die!"
  @State private var animationTrigger = false
  @State private var isDoneAnimating = true
  @State private var rolls: [Int] = []
  private var grandTotal: Int {rolls.reduce(0, +)}
  
  var body: some View {
    VStack {
      Text("Dungeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      GroupBox {
        ForEach(rolls, id: \.self) { roll in
          Text("\(roll)")
            .frame(maxWidth: .infinity, alignment: .leading)

          Divider()
        }
                
        HStack {
          Text("Total: \(grandTotal)")
            .font(.title2)
            .bold()
            .monospacedDigit()
            .contentTransition(.numericText())
            .animation(.default, value: grandTotal)
          
          Spacer()
          
          Button {
            rolls.removeAll()
            message = "Roll a die!"
          } label: {
            Text("Clear")
          }
//          .font(.title2)
          .buttonStyle(.glassProminent)
          .tint(.red)
          .disabled(rolls.isEmpty)
        }

      } label: {
        Text("Session Rolls:")
          .font(.title2)
          .bold()
      }

      Spacer()
      
      Text(message)
        .font(.title)
        .multilineTextAlignment(.center)
        .opacity(isDoneAnimating ? 1.0 : 0.25)
        .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (1, 0, 0))
        .onChange(of: animationTrigger) {
          isDoneAnimating = false
          withAnimation(.interpolatingSpring(duration: 0.8, bounce: 0.4)) {
            isDoneAnimating = true
          }
        }
      
      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        ForEach(Dice.allCases) { die in
          Button {
            animationTrigger.toggle()
            let roll = die.roll
            message = "You rolled a \(roll) on a \(die.name)-die"
            rolls.append(roll)
          } label: {
            Text("\(die.rawValue)-sided")
          }
          .font(.title2)
          .lineLimit(1)
          .fixedSize(horizontal: true, vertical: false)
          .buttonStyle(.glassProminent)
          .tint(.red)
        }
      }
    }
    .padding()
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
