// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Button {
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "button.cancel")
    /// Send
    internal static let send = L10n.tr("Localizable", "button.send")
    /// Try again
    internal static let tryAgain = L10n.tr("Localizable", "button.try-again")
    /// Verify
    internal static let verify = L10n.tr("Localizable", "button.verify")
  }

  internal enum Description {
    /// Please enter the verification code you will receive by SMS
    internal static let code = L10n.tr("Localizable", "description.code")
    /// Please enter your phone number (ex. +32 473123456)
    internal static let phone = L10n.tr("Localizable", "description.phone")
  }

  internal enum Message {
    /// Success!
    internal static let success = L10n.tr("Localizable", "message.success")
  }

  internal enum Placeholder {
    /// Phone Number
    internal static let phone = L10n.tr("Localizable", "placeholder.phone")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: PhoneVerificationController.bundle, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
