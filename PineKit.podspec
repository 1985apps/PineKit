#
# Be sure to run `pod lib lint PineKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PineKit"
  s.version          = "0.1.0"
  s.summary          = "UI Development Kit"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
    The smallest pod ever!
                       DESC

  s.homepage         = "https://github.com/1985apps/PineKit.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Prakash Raman" => "prakash.raman.ka@gmail.com" }
  s.source           = { :git => "https://github.com/1985apps/PineKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PineKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'Cartography'
  s.dependency 'SnapKit', '~> 0.15.0'
  s.dependency 'SwiftyJSON', '~> 2.3.1'
  s.dependency 'Alamofire', '~> 3.3'
  # s.dependency 'BSImagePicker', '~> 2.3'

end
