//
//  DiceEnum.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 17/6/2026.
//

import SwiftUI

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
  
  var name: String {
    return "\(self)".capitalized
  }
  
  var roll: Int {
    return Int.random(in: 1...self.rawValue)
  }
}
