// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Button {
    /// Cancel
    static let cancel = L10n.tr("Localizable", "button.cancel")
    /// Send
    static let send = L10n.tr("Localizable", "button.send")
    /// Try again
    static let tryAgain = L10n.tr("Localizable", "button.try-again")
    /// Verify
    static let verify = L10n.tr("Localizable", "button.verify")
  }

  enum Description {
    /// Please enter the verification code you will receive by SMS
    static let code = L10n.tr("Localizable", "description.code")
    /// Please enter your phone number (ex. +32 473123456)
    static let phone = L10n.tr("Localizable", "description.phone")
  }

  enum Message {
    /// Success!
    static let success = L10n.tr("Localizable", "message.success")
  }

  enum Placeholder {
    /// Phone Number
    static let phone = L10n.tr("Localizable", "placeholder.phone")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: PhoneVerificationController.bundle, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
