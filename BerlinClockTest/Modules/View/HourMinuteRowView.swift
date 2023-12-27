//
//  HourMinuteRowView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct HourMinuteRowView: View {

    let lamps: [Lamp]
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        HStack {
            ForEach(Array(lamps.enumerated()), id: \.offset) { _, lamp in
                HourMinuteView(lamp: lamp,
                               borderColor: borderColor,
                               borderWidth: borderWidth)
            }
        }
    }
}

#Preview {
    HourMinuteRowView(lamps: [.yellow, .yellow, .yellow, .yellow],
                      borderColor: .black,
                      borderWidth: 4)
    .frame(height: 150)
    .padding()
}
