Pod::Spec.new do |spec|
  spec.name         = "ZCCommon"
  spec.version      = "1.0.3"
  spec.summary      = "ZCCommon Kit"
  spec.description  = "ZCCommon 常用库文件"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = 'Library/ZCCommon/**/*.{h,m,mm}'
  spec.public_header_files = 'Library/ZCCommon/**/*.{h}'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'

  spec.ios.dependency 'MBProgressHUD'
  spec.ios.dependency 'ZCEasyLibrary'

  spec.ios.dependency 'AFNetworking'
  spec.ios.dependency 'SDWebImage'
  spec.ios.dependency 'Masonry' #AutoLayout
  spec.ios.dependency 'MJRefresh'
end
