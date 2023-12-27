//
//  SecondLampView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct SecondLampView: View {

    let color: Color
    let borderColor: Color
    let borderWidth: Int

    var body: some View {
        Circle()
            .strokeBorder(borderColor, lineWidth: 4)
            .background(Circle().fill(color))
    }
}

#Preview {
    SecondLampView(color: .yellow,
                   borderColor: .black,
                   borderWidth: 4)
    .padding()
}
