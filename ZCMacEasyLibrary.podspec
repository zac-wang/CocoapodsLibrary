Pod::Spec.new do |spec|
  spec.name         = "ZCMacEasyLibrary"
  spec.version      = "2.0.0"
  spec.summary      = "ZCMacEasyLibrary Kit"
  spec.description  = "ZCMacEasyLibrary 拓展库+UI库"
  spec.platform     = :osx, '10.10'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.source_files = ['Library/EasyLibrary/**/*.{h,m,c,mm}', 'Library/ZCMacEasyLibrary/**/*.{h,m,c,mm}']
  spec.public_header_files = ['Library/EasyLibrary/**/*.{h}', 'Library/ZCMacEasyLibrary/**/*.{h}']
  spec.requires_arc = true
  spec.frameworks   = 'Foundation'
  spec.libraries    = 'z'

end
