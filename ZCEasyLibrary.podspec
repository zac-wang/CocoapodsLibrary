Pod::Spec.new do |spec|
  spec.name         = "ZCEasyLibrary"
  spec.version      = "2.0.3"
  spec.summary      = "ZCEasyLibrary Kit"
  spec.description  = "ZCEasyLibrary 拓展库+UI库"
  spec.platform     = :ios, '8.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = ['Library/EasyLibrary/**/*.{h,m,c,mm}', 'Library/ZCEasyLibrary/**/*.{h,m,c,mm}']
  spec.public_header_files = ['Library/EasyLibrary/**/*.{h}', 'Library/ZCEasyLibrary/**/*.{h}']
  spec.private_header_files = ['Library/EasyLibrary/ZCMutableDeepCopy/NSNumber+MutableDeepCopy.h', 'Library/ZCEasyLibrary/ZCBannerView/ZCBannerImageView.h']
#  spec.resources    = ['Library/ZCEasyLibrary/ZCCitySelect/ZCCitySelectAddressFile.plist']
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
  spec.libraries    = 'z'

end
