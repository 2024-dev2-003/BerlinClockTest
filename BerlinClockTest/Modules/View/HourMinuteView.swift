//
//  HourMinuteView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct HourMinuteView: View {

    let lamp: Lamp
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        Rectangle()
            .strokeBorder(borderColor, lineWidth: 4)
            .background(Rectangle().fill(lamp.color))
    }
}

#Preview {
    HourMinuteView(lamp: .yellow,
                   borderColor: .black,
                   borderWidth: 4)
    .frame(width: 100, height: 200)
}
