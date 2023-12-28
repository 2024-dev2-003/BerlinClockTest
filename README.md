# Berlin Clock Test 2024-DEV2-003

![Alt Text](BerlinClock.gif)

## Summary

The Berlin Clock (Mengenlehreclock or Berlin Uhr) is a clock that tells the time using a series of illuminated coloured blocks, as you can see in the picture for this project.

The top lamp blinks to show seconds- it is illuminated on even seconds and off on odd seconds.

The next two rows represent hours. The upper row represents 5 hour blocks and is made up of 4 red lamps. The lower row represents 1 hour blocks and is also made up of 4 red lamps.

The final two rows represent the minutes. The upper row represents 5 minute blocks, and is made up of 11 lamps- every third lamp is red, the rest are yellow. The bottom row represents 1 minute blocks, and is made up of 4 yellow lamps.


## Notes

- The app has been developed with Xcode 15.0.1 and is optimized on iPhone device in portrait mode.
- No minimum iOS version was asked, so by default I supported n-1 version (iOS 16 minimum).
- No specific configuration needed to execute this project, simply download it, doucle-click on BerlinClockTest.xcodeproj file and run it directly in Xcode.
- The architecture used in this project is MVVM in order to separate display and business logics.
- The UI has been made with SwiftUI and Combine has been used to observe change when the timer is ticking.
- TDD was used during the development, writing tests that fail before writing business code.
- Support Dark Mode


## Useful links

More information can be found here: https://agilekatas.co.uk/katas/BerlinClock-Kata
