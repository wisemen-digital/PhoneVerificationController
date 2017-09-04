//
//  Configuration.swift
//  PhoneVerificationController
//
//  Created by David Jennes on 30/08/2017.
//  Copyright © 2017 Appwise. All rights reserved.
//

import UIKit

public struct Configuration {
	/**
		Block that receives a phone number and is expected to call a completion block with a verification ID.
		
		- Parameter phoneNumber: the phone number to verify
		- Parameter completion: the completion block (must be called!)
	*/
	public typealias RequestCodeBlock = (_ phoneNumber: String, _ completion: @escaping (_ verificationID: String?, _ error: Error?) -> Void) -> Void

	/**
		Block that receives a verification ID and code, and is expected to call a completion block with success (or an error).

		- Parameter verificationID: the verification session ID
		- Parameter verificationCode: the matching verification code
		- Parameter completion: the completion block (must be called!)
	*/
	public typealias SignInBlock = (_ verificationID: String, _ verificationCode: String, _ completion: @escaping (_ error: Error?) -> Void) -> Void

	let statusBar: UIStatusBarStyle
	let keyboard: UIKeyboardAppearance
	let headerBackground: UIImage?
	let headerForeground: UIImage?
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

	/**
		If you already have a verification ID from FireBase, you can set it here to resume code verification.

		NOTE: not implemented yet.
	*/
	public var verificationID: String?

	/**
		Create a configuration object used by the phone verification controller.
	
		- Parameter statusBar: The preferred status bar style for the controller. Default: lightContent
		- Parameter keyboard: The keyboard's appearance when focused on fields. Default: dark
		- Parameter headerBackground: The header's background image (aspect-fill). Default: nil
		- Parameter headerForeground: The header's foreground image (aspect-fit). Default: nil
		- Parameter background: The general background color. Default: black
		- Parameter text: The general foreground (text) color. Default: white
		- Parameter buttonTint: The tint color applied to all buttons and fields. Default: white
		- Parameter buttonTextEnabled: The text color for enabled buttons. Default: white
		- Parameter buttonTextDisabled: The text color for disabled buttons. Default: white
		- Parameter buttonBackgroundEnabled: The background color for enabled buttons. Default: red
		- Parameter buttonBackgroundDisabled: The background color for disabled buttons. Default: lightGray
		- Parameter codeFieldBackgroundEmpty: The background color for empty code fields. Default: clear
		- Parameter codeFieldBackgroundFilled: The background color for filled code fields (and their border). Default: white
		- Parameter codeFieldText: The text color for code fields. Default: black
		- Parameter animationDuration: The duration for all animations. Default: 0.3s
		- Parameter errorDuration: The duration for showing error messages. Default: 5s
		- Parameter requestCode: Block called for requesting the verification code from FireBase Auth API
		- Parameter signIn: Block called for verifying a code with the FireBase Auth API
	*/
	public init(statusBar: UIStatusBarStyle = .lightContent,
	     keyboard: UIKeyboardAppearance = .dark,
	     headerBackground: UIImage? = nil,
	     headerForeground: UIImage? = nil,
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
		self.headerBackground = headerBackground
		self.headerForeground = headerForeground
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
