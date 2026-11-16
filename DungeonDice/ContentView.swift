//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 20/10/2026.
//

import SwiftUI

struct ContentView: View {
  
  @State private var message: String = "Roll a die!"
  @State private var rolls: [Int] = []
  private var grandTotal: Int {
    rolls.reduce(0, +)
  }
  
  @State private var animationTrigger: Bool = true
  @State private var isDoneAnimating: Bool = true
  
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
            .fontWeight(.semibold)
            .monospacedDigit()
            .contentTransition(.numericText())
            .animation(.default, value: grandTotal)
          
          Spacer()
          
          Button {
            rolls.removeAll()
          } label: {
            Text("Clear")
          }
          .font(.title3)
          .fontWeight(.semibold)
          .lineLimit(1)
          .fixedSize(horizontal: true, vertical: false)
          .buttonStyle(.glassProminent)
          .tint(.blue)
          .disabled(rolls.isEmpty)
          
        }

      } label: {
        Text("Session Rolls:")
          .font(.title2)
          .fontWeight(.bold)
      }
      
      
      Spacer()
      
      Text (message)
        .font(.largeTitle)
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
        .multilineTextAlignment(.center)
        .opacity(isDoneAnimating ? 1.0 : 0.2)
        .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (x:1, y:0, z:0))
        .onChange(of: animationTrigger) {
          isDoneAnimating = false
          withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.5)) {
            isDoneAnimating = true
          }
        }
      //      Spacer()
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        
        ForEach(Dice.allCases) { die in
          Button {
            let roll = die.roll
            rolls.append(roll)
            message = ("You rolled a \(roll) on a \(die.dieName).")
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
    
    case d4 = 4
    case d6 = 6
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
    case d100 = 100
    
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

