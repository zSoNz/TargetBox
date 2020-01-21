#
# Be sure to run `pod lib lint TargetBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TargetBox'
  s.version          = '1.0.0'
  s.summary          = 'Tool for split functions on targets. For project with multiple targets.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Tool for split file with two or more targets on independence parts.
                       DESC

  s.homepage         = 'https://github.com/zSoNz/TargetBox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kikacheishvili Bogdan' => '<bogdan.kikacheishvili@idapgroup.com>' }
  s.source           = { :git => 'https://github.com/zSoNz/TargetBox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TargetBox/Classes/**/*'

  s.subspec "Core" do |ss|
    ss.source_files  = "Source/Core/"
    ss.dependency "RxCocoa", "~> 5.0"
    ss.dependency "RxSwift", "~> 5.0"
  end

  # s.resource_bundles = {
  #   'TargetBox' => ['TargetBox/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end