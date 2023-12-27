//
//  BerlinClockView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct BerlinClockView: View {

    public let borderColor: Color
    public let borderWidth: Int

    var body: some View {
        VStack {
            // Second
            SecondLampView(color: .yellow,
                           borderColor: borderColor,
                           borderWidth: borderWidth)
            .frame(width: 130, height: 130)

            // 5hours

            HourMinuteRowView(colors: [.red, .red, .red, .red],
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // hour

            HourMinuteRowView(colors: [.red, .red, .red, .red],
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // 5minutes

            HourMinuteRowView(colors: [.yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow],
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // minutes

            HourMinuteRowView(colors: [.yellow, .yellow, .yellow, .yellow],
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)
        }
        .padding()
    }
}

#Preview {
    BerlinClockView(borderColor: .black,
                    borderWidth: 4)

}
