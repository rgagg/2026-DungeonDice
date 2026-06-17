//
//  DiceEnum.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 17/6/2026.
//

import SwiftUI

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
  
  var name: String {
    return "\(self)".capitalized
  }
  
  var roll: Int {
    return Int.random(in: 1...self.rawValue)
  }
}
