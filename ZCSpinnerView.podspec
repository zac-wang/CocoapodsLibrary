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
#  spec.private_header_files = ['EaseUI/wav.h','EaseUI/opencore-amrwb/*.h']
#  spec.prefix_header_contents = '#import "UIImage+Resource.h"'
#  spec.vendored_libraries = ['EaseUI/3rdparty/libopencore-amrnb.a','EaseUI/3rdparty/libopencore-amrwb.a']
#  spec.resource    = 'ZCSpinnerView/main_banner.bundle'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
#  spec.libraries   = 'stdc++', "xml2"
#  spec.resources   = "Resources/*.png"
#  spec.xcconfig    = {'OTHER_LDFLAGS' => '-ObjC'}
#  spec.xcconfig    = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
#  spec.dependency 'MWPhotoBrowser', '~> 2.1.1'    
#  spec.dependency 'MJRefresh', '~> 3.1.0'
#  spec.dependency 'Hyphenate', '~> 3.3.4'
end
