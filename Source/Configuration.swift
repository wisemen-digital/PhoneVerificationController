//
//  Configuration.swift
//  PhoneVerificationController
//
//  Created by David Jennes on 30/08/2017.
//  Copyright © 2017 Appwise. All rights reserved.
//

import UIKit

public struct Configuration {
	public typealias RequestCodeBlock = (String, @escaping (String?, Error?) -> Void) -> Void
	public typealias SignInBlock = (String, String, @escaping (Error?) -> Void) -> Void

	let statusBar: UIStatusBarStyle
	let keyboard: UIKeyboardAppearance
	let header: UIImage?
	let background: UIColor
	let text: UIColor
	let buttonTint: UIColor
	let buttonTextEnabled: UIColor
	let buttonTextDisabled: UIColor
	let buttonBackgroundEnabled: UIColor
	let buttonBackgroundDisabled: UIColor
	let codeFieldBackgroundEmpty: UIColor
	let codeFieldBackgroundFilled: UIColor
	let codeFieldText: UIColor
	let animationDuration: TimeInterval
	let errorDuration: TimeInterval
	let requestCode: RequestCodeBlock
	let signIn: SignInBlock
	var verificationID: String?

	public init(statusBar: UIStatusBarStyle = .lightContent,
	     keyboard: UIKeyboardAppearance = .dark,
	     header: UIImage? = nil,
	     background: UIColor = .black,
	     text: UIColor = .white,
	     buttonTint: UIColor = .white,
	     buttonTextDisabled: UIColor = .white,
	     buttonTextEnabled: UIColor = .white,
	     buttonBackgroundDisabled: UIColor = .lightGray,
	     buttonBackgroundEnabled: UIColor = .red,
	     codeFieldBackgroundEmpty: UIColor = .clear,
	     codeFieldBackgroundFilled: UIColor = .white,
	     codeFieldText: UIColor = .black,
	     animationDuration: TimeInterval = 0.3,
	     errorDuration: TimeInterval = 5,
	     requestCode: @escaping RequestCodeBlock,
	     signIn: @escaping SignInBlock) {
		self.statusBar = statusBar
		self.keyboard = keyboard
		self.header = header
		self.background = background
		self.text = text
		self.buttonTint = buttonTint
		self.buttonTextDisabled = buttonTextDisabled
		self.buttonTextEnabled = buttonTextEnabled
		self.buttonBackgroundDisabled = buttonBackgroundDisabled
		self.buttonBackgroundEnabled = buttonBackgroundEnabled
		self.codeFieldBackgroundEmpty = codeFieldBackgroundEmpty
		self.codeFieldBackgroundFilled = codeFieldBackgroundFilled
		self.codeFieldText = codeFieldText
		self.animationDuration = animationDuration
		self.errorDuration = errorDuration
		self.requestCode = requestCode
		self.signIn = signIn
	}
}
