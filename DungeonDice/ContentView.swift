//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 20/10/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  @State private var animationTrigger: Bool = true
  @State private var isDoneAnimating: Bool = true
  
  var body: some View {
    VStack {
      Text("Dungeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Text (message)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .opacity(isDoneAnimating ? 1.0 : 0.2)
        .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (x:1, y:0, z:0))
        .onChange(of: animationTrigger) {
          isDoneAnimating = false
          withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.5)) {
            isDoneAnimating = true
          }
        }
      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        
        ForEach(Dice.allCases) { die in
          Button {
            message = ("You rolled a \(die.roll) on a \(die.dieName) sided die.")
            animationTrigger.toggle()
            
          } label: {
            Text ("\(die.buttonLabel)")
          }
        }
        .font(.title2)
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
        .buttonStyle(.glassProminent)
        .tint(.red)
        
        
      }
      .padding()
    }
    
  }
  
  enum Dice: Int, CaseIterable, Identifiable {
    
    case four = 4
    case six = 6
    case eight = 8
    case ten = 10
    case twelve = 12
    case twenty = 20
    case hundred = 100
    
    var id: Int {
      return self.rawValue
    }
    
    var dieName: String {
      return "\(self)".capitalized
    }
    
    var buttonLabel: String {
      return "\(self.rawValue)-Sided"
    }
    
    var roll: Int {
      return Int.random(in: 1...self.rawValue)
    }
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

