Pod::Spec.new do |s|
  s.name         = 'RBScheduler'
  s.summary      = 'RBScheduler SDK for iOS.'
  s.version      = '2.1.2'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Ruibin.Chow' => 'ruibin.chow@qq.com' }
  s.social_media_url = 'https://www.zruibin.cn'
  s.homepage     = 'https://github.com/zruibin/RBScheduler'
  s.source       = { :git => 'https://github.com/zruibin/RBScheduler.git', :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}' #/**/*
  s.public_header_files = 'Classes/*.{h}'
  
  s.frameworks = 'UIKit', 'CoreFoundation', 'Foundation'

end
