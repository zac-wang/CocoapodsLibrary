Pod::Spec.new do |spec|
  spec.name         = "ZCMacEasyLibrary"
  spec.version      = "2.0.6"
  spec.summary      = "ZCMacEasyLibrary Kit"
  spec.description  = "ZCMacEasyLibrary 拓展库+UI库"
  spec.platform     = :osx, '10.10'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = ['Library/EasyLibrary/**/*.{h,m,c,mm}', 'Library/ZCMacEasyLibrary/**/*.{h,m,c,mm}']
  spec.public_header_files = ['Library/EasyLibrary/**/*.{h}', 'Library/ZCMacEasyLibrary/**/*.{h}']

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
    zcstring.source_files = ['Library/ZCString/**/*.{h,m,c,mm}','Library/ZCJson/**/*.{h,m,c,mm}','Library/ZCDate/**/*.{h,m,c,mm}']
    #zcstring.dependency 'AFNetworking', '~> 3.0'
  end

  spec.requires_arc = true
  spec.frameworks   = 'Foundation'
  spec.libraries    = 'z'

end
