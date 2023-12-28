//
//  BerlinClockTestApp.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import SwiftUI

@main
struct BerlinClockTestApp: App {
    var body: some Scene {
        WindowGroup {
            BerlinClockView(
                // ViewModel is hardcoded here but it could come from factory
                // or dependency injection
                viewModel: BerlinClockViewModel(
                    clockEngine: BerlinClockEngine(useCase: LightStateUseCase()),
                    timerManager: TimerManager()
                ),
                borderColor: Color.border,
                borderWidth: 4)
        }
    }
}
