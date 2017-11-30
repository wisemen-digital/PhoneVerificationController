//
//  Phone Entry.swift
//  PhoneVerificationController
//
//  Created by David Jennes on 30/08/2017.
//  Copyright © 2017 Appwise. All rights reserved.
//

import CountryPicker
import PhoneNumberKit
import UIKit

extension PhoneVerificationController: CountryPickerDelegate {
	internal var phoneNumber: String {
		return "\(self.phoneCountryField.text ?? "")\(self.phoneNumberField.text ?? "")"
	}

	@IBAction func phoneFieldChanged(_ sender: UITextField) {
		let valid = (try? PhoneNumberKit().parse(phoneNumber)) != nil

		UIView.animate(withDuration: configuration.animationDuration) { [unowned self] in
			self.phoneSendButton.isEnabled = valid
			self.phoneSendButton.backgroundColor = valid ? self.configuration.buttonBackgroundEnabled : self.configuration.buttonBackgroundDisabled
		}
	}

	public func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
		phoneCountryField.text = phoneCode
		phoneCountryImageView.image = flag

		phoneFieldChanged(phoneCountryField)
	}

	@IBAction func verifyPhoneNumber(_ sender: Any) {
		phoneActivityIndicator.startAnimating()
		configuration.requestCode(phoneNumber) { [weak self] verificationID, error in
			guard let strongSelf = self else { return }

			strongSelf.phoneActivityIndicator.stopAnimating()
			if let error = error {
				strongSelf.show(error: error, in: strongSelf.phoneDescriptionLabel, original: L10n.Description.phone)
			} else if let verificationID = verificationID {
				strongSelf.configuration.verificationID = verificationID
				strongSelf.switchToCodeVerification()
			}
		}
	}

	@IBAction func cancel() {
		if let delegate = delegate {
			delegate.cancelled(controller: self)
		} else {
			self.dismiss(animated: true, completion: nil)
		}
	}

	private func switchToCodeVerification() {
		UIView.animate(withDuration: configuration.animationDuration) { [unowned self] in
			self.phoneContainerView.isHidden = true
			self.phoneContainerView.alpha = 0
			self.codeContainerView.isHidden = false
			self.codeContainerView.alpha = 1

			for field in self.codeTextFields {
				field.text = ""
				field.backgroundColor = .clear
			}
		}
		self.codeTextFields.first?.becomeFirstResponder()
	}
}
