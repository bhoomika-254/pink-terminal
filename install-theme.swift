#!/usr/bin/env swift
// pinkterm — Terminal.app theme installer
// Writes the "Pinkterm" profile (with full ANSI palette) into
// com.apple.Terminal preferences and sets it as default + startup.

import Foundation
import AppKit

func color(_ r: Int, _ g: Int, _ b: Int) -> Data {
    let c = NSColor(srgbRed: CGFloat(r) / 255.0,
                    green:   CGFloat(g) / 255.0,
                    blue:    CGFloat(b) / 255.0,
                    alpha:   1.0)
    return try! NSKeyedArchiver.archivedData(withRootObject: c,
                                             requiringSecureCoding: false)
}

let font = NSFont(name: "Menlo", size: 14)
        ?? NSFont.userFixedPitchFont(ofSize: 14)!
let fontData = try! NSKeyedArchiver.archivedData(withRootObject: font,
                                                 requiringSecureCoding: false)

let profile: [String: Any] = [
    "name": "Pinkterm",
    "type": "Window Settings",
    "ProfileCurrentVersion": 2.07,

    // Window
    "BackgroundColor": color(27, 14, 22),
    "TextColor":       color(255, 217, 230),
    "TextBoldColor":   color(255, 230, 240),
    "CursorColor":     color(255, 102, 179),
    "SelectionColor":  color(74, 31, 55),

    // ANSI palette — pastel + hot pink
    "ANSIBlackColor":   color(45, 31, 41),
    "ANSIRedColor":     color(255, 95, 162),
    "ANSIGreenColor":   color(184, 232, 160),
    "ANSIYellowColor":  color(255, 209, 164),
    "ANSIBlueColor":    color(200, 168, 255),
    "ANSIMagentaColor": color(255, 138, 204),
    "ANSICyanColor":    color(255, 184, 224),
    "ANSIWhiteColor":   color(255, 240, 245),

    "ANSIBrightBlackColor":   color(92, 61, 81),
    "ANSIBrightRedColor":     color(255, 133, 184),
    "ANSIBrightGreenColor":   color(212, 245, 179),
    "ANSIBrightYellowColor":  color(255, 225, 189),
    "ANSIBrightBlueColor":    color(220, 200, 255),
    "ANSIBrightMagentaColor": color(255, 168, 219),
    "ANSIBrightCyanColor":    color(255, 209, 236),
    "ANSIBrightWhiteColor":   color(255, 255, 255),

    // Font + window
    "Font": fontData,
    "FontAntialias": true,
    "FontWidthSpacing": 1.0,
    "FontHeightSpacing": 1.0,
    "columnCount": 110,
    "rowCount": 36,
    "useOptionAsMetaKey": true,
    "ShouldRestoreContent": false,
]

let domain = "com.apple.Terminal"
guard let defaults = UserDefaults(suiteName: domain) else {
    print("Could not open \(domain) defaults")
    exit(1)
}

var windowSettings = (defaults.dictionary(forKey: "Window Settings") ?? [:])
windowSettings["Pinkterm"] = profile
defaults.set(windowSettings, forKey: "Window Settings")
defaults.set("Pinkterm", forKey: "Default Window Settings")
defaults.set("Pinkterm", forKey: "Startup Window Settings")
defaults.synchronize()

print("✓ Pinkterm profile installed and set as default + startup.")
print("  Quit and reopen Terminal.app to see it.")
