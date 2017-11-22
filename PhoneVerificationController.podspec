Pod::Spec.new do |s|
	# info
	s.name = 'PhoneVerificationController'
	s.version = '1.2.2'
	s.summary = 'A nicer UI for FireBase phone authentication.'
	s.description = <<-DESC
	This is a replacement for FireBaseUI for phone authentication. The UI is completely customizable using a configuration structure.
	DESC
	s.homepage = 'https://github.com/appwise-labs/PhoneVerificationController'
	s.authors = {
		'David Jennes' => 'david.jennes@gmail.com',
		'Tom Knapen' => 'tom@knapen.io',
		'Yannick Winters' => 'wintersyannick@gmail.com'
	}
	s.license = {
		:type => 'MIT',
		:file => 'LICENSE'
	}
	s.ios.deployment_target = '9.0'
	
	# files
	s.source = {
		:git => 'https://github.com/appwise-labs/PhoneVerificationController.git',
		:tag => s.version
	}
	s.source_files = 'Source/*.swift'
	s.resource_bundles = {
		'PhoneVerificationControllerResources' => ['Resources/**/*']
	}
	
	# dependencies
	s.dependency 'CountryPickerSwift'
	s.dependency 'PhoneNumberKit'
end
