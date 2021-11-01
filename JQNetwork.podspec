#
# Be sure to run `pod lib lint JQNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JQNetwork'
  s.version          = '1.0.2'
  s.summary          = 'A short description of JQNetwork.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/vidonia/JQNetwork'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vidonia' => 'wangjiaqian93@gmail.com' }
  s.source           = { :git => 'https://github.com/vidonia/JQNetwork.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'


  s.dependency 'AFNetworking'
  
  s.source_files = 'JQNetwork/Classes/JQNetworkDefine.h'

  s.subspec 'Request' do |request|
    request.source_files = 'JQNetwork/Classes/Request/**/*.{h,m}'
    request.public_header_files = 'JQNetwork/Classes/Request/**/*.h'
    request.dependency 'JQNetwork/Response'
  end
  
  s.subspec 'Response' do |response|
    response.source_files = 'JQNetwork/Classes/Response/**/*.{h,m}'
    response.public_header_files = 'JQNetwork/Classes/Response/**/*.h'
  end
   
end
