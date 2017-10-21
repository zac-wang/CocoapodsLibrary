Pod::Spec.new do |spec|
  spec.name         = "ZCVerticalButton"
  spec.version      = "1.0.2"
  spec.summary      = "ZCVerticalButton UI Kit"
  spec.description  = "图标与文字位置自定义，可以上下"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = 'Library/ZCVerticalButton/**/*.{h,m,mm}'
  spec.public_header_files = 'Library/ZCVerticalButton/**/*.{h}'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
end
