Pod::Spec.new do |spec|
  spec.name         = "ZCEasyLibrary"
  spec.version      = "2.0.6"
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
  spec.resources    = 'Library/ZCEasyLibrary/**/*.png', 'Library/ZCEasyLibrary/**/*.plist'

  spec.subspec 'ZCDate' do |zcdate|
    zcdate.source_files = 'Library/ZCDate/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCEncrypt' do |zcencrypt|
    zcencrypt.source_files = 'Library/ZCEncrypt/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCJson' do |zcjson|
    zcjson.source_files = 'Library/ZCJson/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCMutableDeepCopy' do |zcmutableDeepCopy|
    zcmutableDeepCopy.source_files = 'Library/ZCMutableDeepCopy/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCString' do |zcstring|
    zcstring.source_files = 'Library/ZCString/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCScreenCapture' do |zcscreenCapture|
    zcscreenCapture.source_files = 'Library/ZCScreenCapture/**/*.{h,m,c,mm}'
    #zcscreenCapture.dependency 'AFNetworking', '~> 3.0'
  end

  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
  spec.libraries    = 'z'

end
