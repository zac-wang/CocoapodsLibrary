Pod::Spec.new do |spec|
  spec.name         = "ZCSpinnerView"
  spec.version      = "1.0.1"
  spec.summary      = "ZCSpinnerView UI Kit"
  spec.description  = "这是一个下拉框"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = 'ZCSpinnerView/**/*.{h,m,mm}'
  spec.public_header_files = 'ZCSpinnerView/**/*.{h}'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
end
