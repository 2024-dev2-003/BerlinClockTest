//
//  HourMinuteView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct HourMinuteView: View {

    let color: Color
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        Rectangle()
            .strokeBorder(borderColor, lineWidth: 4)
            .background(Rectangle().fill(color))
    }
}

#Preview {
    HourMinuteView(color: .yellow,
                   borderColor: .black,
                   borderWidth: 4)
    .frame(width: 100, height: 200)
}
