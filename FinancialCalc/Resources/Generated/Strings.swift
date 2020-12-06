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
  /// CALCULATE
  internal static let calculateBtnText = L10n.tr("Localizable", "calculate_btn_text")
  /// Compounds Per Year
  internal static let compoundsText = L10n.tr("Localizable", "compounds_text")
  /// CONTINUE
  internal static let continueText = L10n.tr("Localizable", "continue_text")
  /// Monthly contribution
  internal static let contributionValueText = L10n.tr("Localizable", "contribution_value_text")
  /// Solve all your financial math at one place. Nothing matters more..Calculations for Loans, Investments, Mortgage, Savings etc..
  internal static let dynamicText1 = L10n.tr("Localizable", "dynamic_text1")
  /// bla bla bla2
  internal static let dynamicText2 = L10n.tr("Localizable", "dynamic_text2")
  /// bla bla bla3
  internal static let dynamicText3 = L10n.tr("Localizable", "dynamic_text3")
  /// bla bla bla4
  internal static let dynamicText4 = L10n.tr("Localizable", "dynamic_text4")
  /// Future Value
  internal static let futureValueText = L10n.tr("Localizable", "future_value_text")
  /// WELCOME TO
  internal static let greetingText = L10n.tr("Localizable", "greeting_text")
  /// Interest Rate
  internal static let interestText = L10n.tr("Localizable", "interest_text")
  /// Loan Amount
  internal static let loanValueText = L10n.tr("Localizable", "loan_value_text")
  /// Payment
  internal static let paymentValueText = L10n.tr("Localizable", "payment_value_text")
  /// Present Value
  internal static let presentValueText = L10n.tr("Localizable", "present_value_text")
  /// RESET
  internal static let resetBtnText = L10n.tr("Localizable", "reset_btn_text")
  /// Years
  internal static let yearsText = L10n.tr("Localizable", "years_text")
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
