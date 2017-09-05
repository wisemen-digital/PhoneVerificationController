//
//  PhoneVerificationController.swift
//  PhoneVerificationController
//
//  Created by David Jennes on 30/08/2017.
//  Copyright © 2017 Appwise. All rights reserved.
//

import CountryPicker
import UIKit

public protocol PhoneVerificationDelegate: class {
	func cancelled(controller: PhoneVerificationController)
	func verified(phoneNumber: String, controller: PhoneVerificationController)
}

open class PhoneVerificationController: UIViewController {
	@IBOutlet var headerBackgroundImageView: UIImageView!
	@IBOutlet var headerForegroundImageView: UIImageView!
	@IBOutlet var phoneContainerView: UIView!
	@IBOutlet var phoneActivityIndicator: UIActivityIndicatorView!
	@IBOutlet var phoneCountryImageView: UIImageView!
	@IBOutlet var phoneCountryField: UITextField!
	@IBOutlet var phoneNumberField: UITextField!
	@IBOutlet var phoneSendButton: UIButton!
	@IBOutlet var phoneCancelButton: UIButton!
	@IBOutlet var phoneDescriptionLabel: UILabel!
	@IBOutlet var codeContainerView: UIView!
	@IBOutlet var codeTextFields: [UITextField]!
	@IBOutlet var codeActivityIndicator: UIActivityIndicatorView!
	@IBOutlet var codeSendButton: UIButton!
	@IBOutlet var codeTryAgainButton: UIButton!
	@IBOutlet var codeDescriptionLabel: UILabel!

	static let bundle: Bundle = {
		guard let path = Bundle(for: PhoneVerificationController.self).path(forResource: "PhoneVerificationControllerResources", ofType: "bundle"),
			let bundle = Bundle(path: path) else {
				fatalError("Unable to find resources bundle path")
		}
		return bundle
	}()
	fileprivate lazy var countryPicker: CountryPicker = {
		let picker = CountryPicker()

		picker.countryPickerDelegate = self
		picker.showPhoneNumbers = true
		picker.setCountry(Locale.current.regionCode ?? "")

		return picker
	}()
	fileprivate var originalText = [UILabel: String]()
	fileprivate var errorTask = [UILabel: DispatchWorkItem]()
	internal(set) var configuration: Configuration
	public weak var delegate: PhoneVerificationDelegate?

	public init(configuration: Configuration) {
		self.configuration = configuration
		super.init(nibName: nil, bundle: PhoneVerificationController.bundle)
	}

	public required init?(coder aDecoder: NSCoder) {
		configuration = Configuration(requestCode: { _, completion in completion(nil, nil) },
		                              signIn: { _, _, completion in completion(nil) })
		super.init(coder: aDecoder)
	}
}

// MARK: - Controller lifecycle

extension PhoneVerificationController {
	override open func viewDidLoad() {
		super.viewDidLoad()

		// sort by x (outlet collections have no guaranteed order)
		codeTextFields.sort { left, right in
			let a = view.convert(left.bounds, from: left)
			let b = view.convert(right.bounds, from: right)
			return a.midX < b.midX
		}

		// connect some stuff
		phoneCountryField.inputView = countryPicker
		for field in codeTextFields {
			field.delegate = self
		}
		for label in [phoneDescriptionLabel, codeDescriptionLabel] as [UILabel] {
			originalText[label] = label.text ?? ""
		}

		// apply configuration
		apply(configuration: configuration)
		codeContainerView.isHidden = true
		codeContainerView.alpha = 0
	}

	override open var preferredStatusBarStyle: UIStatusBarStyle {
		return configuration.statusBar
	}

	override open func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		phoneNumberField.becomeFirstResponder()
	}

	override open func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		view.endEditing(true)
	}
}

// MARK: - Helper methods

extension PhoneVerificationController {
	fileprivate func apply(configuration: Configuration) {
		for view in [view, phoneContainerView, codeContainerView] {
			view?.backgroundColor = configuration.background
		}
		headerBackgroundImageView.image = configuration.headerBackground
		headerForegroundImageView.image = configuration.headerForeground
		for label in [phoneDescriptionLabel, codeDescriptionLabel] {
			label?.textColor = configuration.text
		}
		for button in [phoneCancelButton, codeTryAgainButton] {
			button?.tintColor = configuration.buttonTint
		}
		for button in [phoneSendButton, codeSendButton] {
			button?.setTitleColor(configuration.buttonTextEnabled, for: .normal)
			button?.setTitleColor(configuration.buttonTextDisabled, for: .disabled)
			button?.backgroundColor = configuration.buttonBackgroundDisabled
		}
		for field in [phoneCountryField, phoneNumberField] + codeTextFields {
			field.keyboardAppearance = configuration.keyboard
			field.tintColor = configuration.buttonTint
			field.textColor = configuration.text
		}
		for field in codeTextFields {
			field.layer.borderColor = configuration.codeFieldBackgroundFilled.cgColor
			field.textColor = configuration.codeFieldText
		}
	}

	internal func show(error: Error, in label: UILabel) {
		errorTask[label]?.cancel()
		label.text = error.localizedDescription

		// enqueue error
		let task = DispatchWorkItem { [weak self] in
			label.text = self?.originalText[label]
		}
		DispatchQueue.main.asyncAfter(deadline: .now() + configuration.errorDuration, execute: task)
		errorTask[label] = task
	}
}
