//
//  CountBadgeView.swift
//  2026-DungeonDice
//
//  Created by Richard Gagg on 20/6/2026.
//

import SwiftUI

struct CountBadgeView: View {
  let dieCount: Int
  
    var body: some View {
        Text("\(dieCount)✕")
        .font(.callout)
        .fontWeight(.semibold)
        .padding(.horizontal, 6)
        .background(.red.opacity(0.2), in: Capsule())
        .overlay {
          Capsule().stroke(.red.opacity(0.4), lineWidth: 1)
        }
    }
}







#Preview("Light Mode") {
  CountBadgeView(dieCount: 3)
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
  CountBadgeView(dieCount: 3)
    .preferredColorScheme(.dark)
}
