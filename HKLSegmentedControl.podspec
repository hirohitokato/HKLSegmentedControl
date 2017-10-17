Pod::Spec.new do |s|
  s.name         = "HKLSegmentedControl"
  s.version      = "1.1.0"
  s.summary      = "A subclass of UISegmentedControl which supports dynamically value changing."

  s.description  = <<-DESC
                   HKLSegmentedControl is a fully compatible class with UISegmentedControl.
                   In addition to that, it supports touch moving events.
                   The delegate method is called each time when you swipe on the control.
                   DESC

  s.homepage     = "https://github.com/hirohitokato/HKLSegmentedControl"
  s.screenshots  = "https://raw.githubusercontent.com/hirohitokato/HKLSegmentedControl/master/images/screenshots_1.gif"
  s.source       = { :git => "https://github.com/hirohitokato/HKLSegmentedControl.git", :tag => "v#{s.version}" }

  s.license      = "MIT"
  s.author       = "Hirohito Kato"
  s.social_media_url   = "http://twitter.com/hkato193"

  s.platform     = :ios
  s.ios.deployment_target = "8.4"

  s.requires_arc = true

  s.source_files  = "Libs/*.{h,m}"
end
