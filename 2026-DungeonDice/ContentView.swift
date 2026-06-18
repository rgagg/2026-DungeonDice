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
//        .scaleEffect(isDoneAnimating ? 1.0 : 0.5)
        .opacity(isDoneAnimating ? 1.0 : 0.25)
        .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (1, 0, 0))
        .onChange(of: animationTrigger) {
          isDoneAnimating = false
//          withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
//            isDoneAnimating = true
//          }
          withAnimation(.interpolatingSpring(duration: 0.8, bounce: 0.4)) {
            isDoneAnimating = true
          }
        }
      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        ForEach(Dice.allCases) { die in
          Button {
            animationTrigger.toggle()
            message = "You rolled a \(die.roll) on a \(die.name)-sided die"
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
