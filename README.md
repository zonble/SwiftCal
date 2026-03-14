SwiftCal (Deprecated)
=====================

> **⚠️ This project is deprecated and no longer maintained.**

## Why This Project Is Deprecated

This project was created in June 2014 as a personal study exercise when Apple first announced the Swift programming language at WWDC 2014. It was written using the very first beta release of Swift (Swift 1.x / Xcode 6.0) and was never intended for production use.

The project is deprecated for the following reasons:

- **Swift language evolution**: Swift underwent significant breaking changes between versions 1.x and 2.x, and again through subsequent major releases. The syntax used in this project is completely incompatible with any modern version of Swift and **will not compile** with any Swift toolchain released after 2015.
- **Outdated Swift 1.x syntax**: The code relies on early Swift constructs that were later removed or changed, including non-optional `@IBOutlet` declarations (e.g., `@IBOutlet var textLabel: UILabel`), use of `operator` as a variable name (which became a reserved keyword), and the `contains(_:_:)` free function.
- **Scope**: It was a minimal learning project to explore Swift syntax and UIKit integration, not a complete or robust application.

## Technical Details

- **Language**: Swift 1.x (Xcode 6.0, released 2014)
- **Platform**: iOS 8.0+, armv7
- **Framework**: UIKit
- **Architecture**: Single-view application using Main.storyboard
- **Project structure**:
  - `SIllyCalSwift/AppDelegate.swift` — Standard `UIApplicationDelegate` entry point.
  - `SIllyCalSwift/ViewController.swift` — Main view controller containing all calculator logic.
  - `SIllyCalSwift/Base.lproj/Main.storyboard` — UI layout wired via `@IBOutlet` and `@IBAction`.
  - `SIllyCalSwiftTests/SIllyCalSwiftTests.swift` — XCTest unit test target (placeholder stubs only).
- **Features implemented**:
  - Basic arithmetic operations: addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`)
  - Divide-by-zero guard with a `UIAlertView` warning
  - Toggle positive/negative sign
  - Memory functions: MC (Memory Clear), M+ (Memory Add), M- (Memory Subtract), MR (Memory Recall)
- **Author**: Weizhong Yang (zonble)

## Original Objective-C Version

This project is a Swift port of an earlier Objective-C calculator. The original source can be found at:
https://github.com/zonble/SillyCal
