//
//  SecondLampView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct SecondLampView: View {

    let lamp: Lamp
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        Circle()
            .strokeBorder(borderColor, lineWidth: 4)
            .background(Circle().fill(lamp.color))
    }
}

#Preview {
    SecondLampView(lamp: .yellow,
                   borderColor: Color.border,
                   borderWidth: 4)
    .padding()
}
