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
            .frame(width: 150, height: 150)


            // 5hours

            // hour

            // 5minutes

            // minutes

        }
        .padding()
    }
}

#Preview {
    BerlinClockView(borderColor: .black,
                    borderWidth: 4)

}
