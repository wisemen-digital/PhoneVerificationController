# PhoneVerificationController

[![CI Status](http://img.shields.io/travis/djbe/PhoneVerificationController.svg?style=flat)](https://travis-ci.org/djbe/PhoneVerificationController)
[![Version](https://img.shields.io/cocoapods/v/PhoneVerificationController.svg?style=flat)](https://cocoapods.org/pods/PhoneVerificationController)
[![License](https://img.shields.io/cocoapods/l/PhoneVerificationController.svg?style=flat)](https://cocoapods.org/pods/PhoneVerificationController)
[![Platform](https://img.shields.io/cocoapods/p/PhoneVerificationController.svg?style=flat)](https://cocoapods.org/pods/PhoneVerificationController)

<a href="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/01.png"><img width=150 height=267 src="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/01.png" alt="Screenshots" /></a>
<a href="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/02.png"><img width=150 height=267 src="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/02.png" alt="Screenshots" /></a>
<a href="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/03.png"><img width=150 height=267 src="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/03.png" alt="Screenshots" /></a>
<a href="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/04.png"><img width=150 height=267 src="https://raw.githubusercontent.com/djbe/PhoneVerificationController/master/Example/Screenshots/04.png" alt="Screenshots" /></a>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate PhoneVerificationController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'FireBase/Auth'
pod 'PhoneVerificationController'
```

Note that you'll need to add `FireBase/Auth` as well (we can't depend on it as it's a static framework). Then, run the following command:

```bash
$ pod install
```

## Usage

Follow the first 2 steps for Firebase authentication on iOS as documenteded [here](https://firebase.google.com/docs/auth/ios/phone-auth). PhoneVerificationController will handle the rest, as long as you invoke it using:

```swift
import FirebaseAuth
import PhoneVerificationController

let configuration = Configuration(requestCode: { phone, completion in
	PhoneAuthProvider.provider().verifyPhoneNumber(phone, completion: completion)
}, signIn: { verificationID, verificationCode, completion in
	let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
	Auth.auth().signIn(with: credential) { _, error in completion(error) }
})
let vc = PhoneVerificationController(configuration: configuration)
vc.delegate = self
present(vc, animated: true)
```

You'll receive a callback if the verification succeeds, or is cancelled.

## Authors

- [David Jennes](https://github.com/djbe)
- [Tom Knapen](https://github.com/wassup-)
- [Yannick Winters](https://github.com/YWinters)

## License

PhoneVerificationController is available under the MIT license. See the LICENSE file for more info.
