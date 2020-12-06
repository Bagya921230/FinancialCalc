// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#111111"></span>
  /// Alpha: 100% <br/> (0x111111ff)
  internal static let black = ColorName(rgbaValue: 0x111111ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#979797"></span>
  /// Alpha: 100% <br/> (0x979797ff)
  internal static let border = ColorName(rgbaValue: 0x979797ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#562600"></span>
  /// Alpha: 100% <br/> (0x562600ff)
  internal static let brown = ColorName(rgbaValue: 0x562600ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2d2d2d"></span>
  /// Alpha: 100% <br/> (0x2d2d2dff)
  internal static let buttonGrey = ColorName(rgbaValue: 0x2d2d2dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#2d2d2d"></span>
  /// Alpha: 74% <br/> (0x2d2d2dbf)
  internal static let buttonGreyLight = ColorName(rgbaValue: 0x2d2d2dbf)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#0f0a0b"></span>
  /// Alpha: 100% <br/> (0x0f0a0bff)
  internal static let dark = ColorName(rgbaValue: 0x0f0a0bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#7c0a02"></span>
  /// Alpha: 100% <br/> (0x7c0a02ff)
  internal static let deleteRed = ColorName(rgbaValue: 0x7c0a02ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 14% <br/> (0xffffff26)
  internal static let disabledWhite = ColorName(rgbaValue: 0xffffff26)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1bc102"></span>
  /// Alpha: 100% <br/> (0x1bc102ff)
  internal static let flashGreen = ColorName(rgbaValue: 0x1bc102ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff5d5d"></span>
  /// Alpha: 100% <br/> (0xff5d5dff)
  internal static let grapeFruitPink = ColorName(rgbaValue: 0xff5d5dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eeeeee"></span>
  /// Alpha: 100% <br/> (0xeeeeeeff)
  internal static let lightGrey = ColorName(rgbaValue: 0xeeeeeeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6b6b6b"></span>
  /// Alpha: 100% <br/> (0x6b6b6bff)
  internal static let lightSilver = ColorName(rgbaValue: 0x6b6b6bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d1d1d6"></span>
  /// Alpha: 100% <br/> (0xd1d1d6ff)
  internal static let placeholder = ColorName(rgbaValue: 0xd1d1d6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#8c0045"></span>
  /// Alpha: 100% <br/> (0x8c0045ff)
  internal static let primary = ColorName(rgbaValue: 0x8c0045ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff9800"></span>
  /// Alpha: 74% <br/> (0xff9800bf)
  internal static let primaryLight = ColorName(rgbaValue: 0xff9800bf)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ec7d2c"></span>
  /// Alpha: 100% <br/> (0xec7d2cff)
  internal static let secoandary = ColorName(rgbaValue: 0xec7d2cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d1d1d6"></span>
  /// Alpha: 100% <br/> (0xd1d1d6ff)
  internal static let silver = ColorName(rgbaValue: 0xd1d1d6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#925200"></span>
  /// Alpha: 100% <br/> (0x925200ff)
  internal static let warmBrown = ColorName(rgbaValue: 0x925200ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let white = ColorName(rgbaValue: 0xffffffff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
