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
  @State private var dieGroups: [DieGroup] = []
  private var grandTotal: Int {dieGroups.reduce(0, { $0 + $1.subTotal })}
  
  var body: some View {
    VStack {
      Text("Dungeon Dice!")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      GroupBox {
        ViewThatFits(in: .vertical) {
          rollList
          
          ScrollView {
            rollList
          }
        }
        
        HStack {
          Text("Total: \(grandTotal)")
            .font(.title2)
            .bold()
            .monospacedDigit()
            .contentTransition(.numericText())
          
          Spacer()
          
          Button {
            withAnimation(.snappy){
              dieGroups.removeAll()
              message = "Roll a die!"
            }
          } label: {
            Text("Clear")
          }
          .buttonStyle(.glassProminent)
          .tint(.red)
          .disabled(dieGroups.isEmpty)
        }
      }
      label: {
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
        .padding(.vertical, 10)
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
        ForEach(Dice.allCases) { die in
          Button {
            performRoll(die: die)
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
  
  func performRoll(die: Dice) {
    withAnimation(.snappy) {
      animationTrigger.toggle()
      let roll = die.roll
      message = "You rolled a \(roll) on a \(die.name)-die"
      
      /*
       Two cases for the append.
       1. The dieGroup already exists in dieGroups.
       (e.g. you have already rolled thay type of die.)
       If this is the case, we just want to append the new roll to end of the rolls property.
       OR
       2. We need to create a new rollGroup and add the roll to that rollGroups rolls array.
       */
      
      // Check to see if the dieGroup for the die rolled exists.
      if let index = dieGroups.firstIndex(where: { $0.id == die.rawValue }) {
        dieGroups[index].rollValues.append(roll)
      } else {
        dieGroups.append(DieGroup(id: die.rawValue, diceLabel: "\(die)", rollValues: [roll]))
      }
      dieGroups.sort { $0.id < $1.id }
    }
  }
  
  struct DieGroup: Identifiable {
    let id: Int
    let diceLabel: String
    var rollValues: [Int] = []
    var rollString: String {
      rollValues.map { "\($0)" }.joined(separator:  ", ")
    }
    var subTotal: Int {
      rollValues.reduce (0, +)
    }
  }
  
  @ViewBuilder
  private var rollList: some View {
    LazyVStack(alignment: .leading) {
      if dieGroups.isEmpty {
        Text("No rolls yet - tap a die below.")
          .font(.title2)
          .foregroundStyle(.secondary)
        
        Divider()
        
      } else {
        ForEach(dieGroups) { dieGroup in
          HStack {
            CountBadgeView(dieCount: dieGroup.rollValues.count)
            
            Text(dieGroup.diceLabel)
              .fontWeight(.semibold)
              .padding(.trailing, 6)
            
            Text(dieGroup.rollString)
              .foregroundStyle(.secondary)
              .italic()
            
            Spacer()
            
            Text("\(dieGroup.subTotal)")
              .font(.title3)
              .foregroundStyle(.secondary)
              .monospacedDigit()
              .contentTransition(.numericText())
          }
          
          Divider()
        }
      }
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
