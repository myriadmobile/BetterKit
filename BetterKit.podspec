#
# Be sure to run `pod lib lint BetterKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BetterKit'
  s.version          = '0.2.1'
  s.summary          = 'A collection of useful tools to enhance standard application development'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BetterKit provides a collection of useful extension methods off existing libraries that assist in speeding up development.
No subclassing, just import and enjoy a better experience!
                       DESC

  s.homepage         = 'https://github.com/myriadmobile/BetterKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'myriadmobile' => 'developer@myriadmobile.com' }
  s.source           = { :git => 'https://github.com/myriadmobile/BetterKit.git', :branch => 'master', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  
  s.source_files = 'BetterKit/Classes/**/*.{swift,h,m}'

  s.frameworks = 'UIKit'
end
