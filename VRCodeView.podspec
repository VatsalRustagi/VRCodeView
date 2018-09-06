#
# Be sure to run `pod lib lint VRCodeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VRCodeView'
  s.version          = '0.2.0'
  s.summary          = 'A light-weight customizable UIView to enter verification codes written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
VRCodeView is a light-weight, highly customizable and beautiful subclass of UIView that allows the user to enter verification code characters one textfield at a time, and move back and forth smoothly.
                       DESC

  s.homepage         = 'https://github.com/VatsalRustagi/VRCodeView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vatsal Rustagi' => 'vatsalr23@gmail.com' }
  s.source           = { :git => 'https://github.com/VatsalRustagi/VRCodeView.git', :tag => s.version.to_s }
#  s.social_media_url = 'https://www.linkedin.com/in/vatsalrustagi'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Classes/*'
  s.swift_version = '4.1'
  
  # s.resource_bundles = {
  #   'VRCodeView' => ['VRCodeView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
