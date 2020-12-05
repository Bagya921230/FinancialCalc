// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// FinCalc
  internal static let appName = L10n.tr("Localizable", "app_name")
  /// FIN
  internal static let appNameText1 = L10n.tr("Localizable", "app_name_text1")
  /// CALC
  internal static let appNameText2 = L10n.tr("Localizable", "app_name_text2")
  /// CONTINUE
  internal static let continueText = L10n.tr("Localizable", "continue_text")
  /// You do not have any email addresses in your account. Please enter your email address to receive the receipt
  internal static let dynamicText1 = L10n.tr("Localizable", "dynamic_text1")
  /// bla bla bla2
  internal static let dynamicText2 = L10n.tr("Localizable", "dynamic_text2")
  /// bla bla bla3
  internal static let dynamicText3 = L10n.tr("Localizable", "dynamic_text3")
  /// bla bla bla4
  internal static let dynamicText4 = L10n.tr("Localizable", "dynamic_text4")
  /// WELCOME TO
  internal static let greetingText = L10n.tr("Localizable", "greeting_text")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
