//
//  BerlinClockViewModel.swift
//  BerlinClockTest
//
//  Created by 2024-dev2-003 on 27/12/2023.
//

import Combine
import Foundation

/// This viewModel is used for business logic of the main view BerlinClockView.
/// The view can listen the BerlinClock object publisher to be notified when it needs to be refreshed.
/// Also, we can start and stop the timer that is ticking.
public protocol BerlinClockViewModelProtocol: ObservableObject {
    var berlinClockPublisher: Published<BerlinClock>.Publisher { get }

    func startTimer()
    func stopTimer()
}

public class BerlinClockViewModel: BerlinClockViewModelProtocol {

    private let clockEngine: BerlinClockEngineProtocol
    private let timerManager: TimerManagerProtocol

    // Publisher
    @Published private var berlinClock: BerlinClock
    public var berlinClockPublisher: Published<BerlinClock>.Publisher { $berlinClock }

    private var cancellables = Set<AnyCancellable>()

    public init(clockEngine: BerlinClockEngineProtocol, timerManager: TimerManagerProtocol) {
        self.clockEngine = clockEngine
        self.timerManager = timerManager

        self.berlinClock = clockEngine.clockOff

        listenTimer()
    }

    public func startTimer() {
        timerManager.start()
    }

    public func stopTimer() {
        timerManager.stop()
    }

    private func listenTimer() {
        timerManager.currentDatePublisher
            .dropFirst() // We don't want to trigger the initial value until timer start
            .sink { [weak self] date in
                guard let self else { return }
                self.berlinClock = self.clockEngine.clock(for: date)
            }
            .store(in: &cancellables)
    }

}

