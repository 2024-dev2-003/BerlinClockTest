//
//  BerlinClockView.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

struct BerlinClockView<T: BerlinClockViewModelProtocol>: View {

    @ObservedObject public var viewModel: T
    public let borderColor: Color
    public let borderWidth: Int

    @State private var secondLamp: Lamp = .off
    @State private var fiveHoursLamp: [Lamp] = Array(repeating: .off, count: 4)
    @State private var hoursLamp: [Lamp] = Array(repeating: .off, count: 4)
    @State private var fiveMinutesLamp: [Lamp] = Array(repeating: .off, count: 11)
    @State private var minutesLamp: [Lamp] = Array(repeating: .off, count: 4)
    @State private var time: String = "--:--"

    var body: some View {
        VStack {
            // Second
            SecondLampView(lamp: secondLamp,
                           borderColor: borderColor,
                           borderWidth: borderWidth)
            .frame(width: 130, height: 130)

            // 5hours

            HourMinuteRowView(lamps: fiveHoursLamp,
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // hour

            HourMinuteRowView(lamps: hoursLamp,
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // 5minutes

            HourMinuteRowView(lamps: fiveMinutesLamp,
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // minutes

            HourMinuteRowView(lamps: minutesLamp,
                              borderColor: borderColor,
                              borderWidth: borderWidth)
            .frame(height: 75)

            // digital clock

            Text(time)
        }
        .padding()
        .onReceive(viewModel.berlinClockPublisher) { berlinClock in
            secondLamp = berlinClock.second
            fiveHoursLamp = berlinClock.fiveHours
            hoursLamp = berlinClock.hours
            fiveMinutesLamp = berlinClock.fiveMinutes
            minutesLamp = berlinClock.minutes
            time = berlinClock.time
        }
        .onAppear(perform: {
            viewModel.startTimer()
        })
        .onDisappear(perform: {
            viewModel.stopTimer()
        })

    }
}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(clockEngine: BerlinClockEngine(useCase: LightStateUseCase()),
                                                    timerManager: TimerManager()),
                    borderColor: .black,
                    borderWidth: 4)

}
