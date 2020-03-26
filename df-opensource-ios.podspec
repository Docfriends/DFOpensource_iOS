#
# Be sure to run `pod lib lint df-opensource-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'df-opensource-ios'
  s.version          = '0.1.4'
  s.summary          = '닥프렌즈의 오픈소스라이브러리'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
오픈소스를 쉽게 고지할수 있는 컨트롤러
                       DESC

  s.homepage         = 'https://github.com/Docfriends/df-opensource-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Docfriends' => 'apps@docfriends.com' }
  s.source           = { :git => 'https://github.com/Docfriends/df-opensource-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'df-opensource-ios/Classes/**/*'
  
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'df-opensource-ios' => ['df-opensource-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
