Pod::Spec.new do |spec|
  spec.name         = "ZCBannerView"
  spec.version      = "1.0.2"
  spec.summary      = "ZCBannerView UI Kit"
  spec.description  = "这是一个滚动条"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = 'ZCBannerView/**/*.{h,m,mm}'
  spec.public_header_files = 'ZCBannerView/**/*.{h}'
#  spec.resource    = 'ZCBannerView/main_banner.bundle'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
end
