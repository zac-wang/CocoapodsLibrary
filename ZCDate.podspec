Pod::Spec.new do |spec|
  spec.name         = "ZCDate"
  spec.version      = "1.0.2"
  spec.summary      = "ZCDate Category"
  spec.description  = "拓展Date相关类的类别，使用更加方便"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = 'Library/ZCDate/**/*.{h,m,mm}'
  spec.public_header_files = 'Library/ZCDate/**/*.{h}'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
end
