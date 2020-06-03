Pod::Spec.new do |spec|
  spec.name         = "ZCEasyLibrary"
  spec.version      = "2.1.1"
  spec.summary      = "ZCEasyLibrary Kit"
  spec.description  = "ZCEasyLibrary 拓展库+UI库, 包含 iOS and OS X. ZCMacEasyLibrary停止更新"
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = { '王志超' => 'love_iphone@qq.com' }
  spec.license      = { :type => 'BSD', :text => 'Zac Inc. 2017' }
  spec.source       = { :git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'

  spec.source_files     = 'Library/ZCEasyLibrary/**/*.{h,m,c,mm}'
  spec.ios.source_files = 'Library/ZCEasyLibraryIOS/**/*.{h,m,c,mm}'
  spec.osx.source_files = 'Library/ZCEasyLibraryMac/**/*.{h,m,c,mm}'

  spec.public_header_files     = 'Library/ZCEasyLibrary/**/*.{h}'
  spec.ios.public_header_files = 'Library/ZCEasyLibraryIOS/**/*.{h}'
  spec.osx.public_header_files = 'Library/ZCEasyLibraryMac/**/*.{h}'


  spec.subspec 'ZCDate' do |sp|
    sp.source_files = 'Library/ZCEasyLibrary_sub/ZCDate/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCEncrypt' do |sp|
    sp.source_files = 'Library/ZCEasyLibrary_sub/ZCEncrypt/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCJson' do |sp|
    sp.source_files = 'Library/ZCEasyLibrary_sub/ZCJson/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCMutableDeepCopy' do |sp|
    sp.source_files = 'Library/ZCEasyLibrary_sub/ZCMutableDeepCopy/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCString' do |sp|
    sp.source_files = 'Library/ZCEasyLibrary_sub/ZCString/**/*.{h,m,c,mm}'
    sp.dependency 'ZCEasyLibrary/ZCDate'
    sp.dependency 'ZCEasyLibrary/ZCJson'
  end


  spec.subspec 'ZCBannerView' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCBannerView/**/*.{h,m,c,mm}'
    sp.private_header_files = 'Library/ZCEasyLibraryIOS_sub/ZCBannerView/ZCBannerImageView.h'
  end

  spec.subspec 'ZCCitySelect' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCCitySelect/**/*.{h,m,c,mm}'
    sp.resources = 'Library/ZCEasyLibraryIOS_sub/ZCCitySelect/**/*.plist'
  end

  spec.subspec 'ZCKeyBoardTopBar' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCKeyBoardTopBar/**/*.{h,m,c,mm}'
    sp.dependency 'ZCEasyLibrary/ZCTextSelectedRange'
  end

  spec.subspec 'ZCReachability' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCReachability/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCScreenCapture' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCScreenCapture/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCSpinnerView' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCSpinnerView/**/*.{h,m,c,mm}'
  end

  spec.subspec 'ZCTextSelectedRange' do |sp|
    sp.platform = :ios
    sp.source_files = 'Library/ZCEasyLibraryIOS_sub/ZCTextSelectedRange/**/*.{h,m,c,mm}'
  end


  spec.subspec 'ZCScanQRCode' do |sp|
    sp.platform = :osx
    sp.source_files = 'Library/ZCEasyLibraryMac_sub/ZCScanQRCode/**/*.{h,m,c,mm}'
  end

  spec.requires_arc = true
  spec.frameworks   = 'Foundation'
  spec.ios.framework  = 'UIKit'
  spec.libraries    = 'z'

  #spec.dependency 'AFNetworking', '~> 3.0'

end
