Pod::Spec.new do |s|
  s.name         = 'RBScheduler'
  s.summary      = 'RBScheduler SDK for iOS.'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Ruibin.Chow' => 'ruibin.chow@qq.com' }
  s.social_media_url = 'http://www.zruibin.cc'
  s.homepage     = 'https://github.com/zruibin/RBScheduler'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.7'
  s.source       = { :git => 'https://github.com/zruibin/RBScheduler.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}' #/**/*
  s.public_header_files = 'Classes/*.{h}'
  
  s.frameworks = 'UIKit', 'CoreFoundation', 'Foundation'

end
