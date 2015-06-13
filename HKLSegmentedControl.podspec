#
#  Be sure to run `pod spec lint HKLSegmentedControl.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HKLSegmentedControl"
  s.version      = "1.0.0"
  s.summary      = "A subclass of UISegmentedControl which supports dynamically value changing."

  s.description  = <<-DESC
                   HKLSegmentedControl is a fully compatible class with UISegmentedControl.
                   In addition to that, it supports touch moving events.
                   The delegate method is called each time when you swipe on the control.
                   DESC

  s.homepage     = "https://github.com/katokichisoft/HKLSegmentedControl"
  s.screenshots  = "www.example.com/screenshots_1.gif"

  s.license      = "MIT"
  s.author    = "Hirohito Kato"
  s.social_media_url   = "http://twitter.com/hkato193"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/katokichisoft/HKLSegmentedControl.git", :tag => "1.0.0" }
  s.source_files  = "Libs", "Libs/*.{h,m}"
  s.exclude_files = ""

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
