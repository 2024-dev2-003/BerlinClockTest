//
//  HourMinuteRowView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct HourMinuteRowView: View {

    let colors: [Color]
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                HourMinuteView(color: color,
                               borderColor: borderColor,
                               borderWidth: borderWidth)
            }
        }
    }
}

#Preview {
    HourMinuteRowView(colors: [.yellow, .yellow, .yellow, .yellow],
                   borderColor: .black,
                   borderWidth: 4)
    .frame(height: 150)
    .padding()
}
