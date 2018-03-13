Pod::Spec.new do |spec|
  spec.name         = "ZCMacEasyLibrary"
  spec.version      = "1.0.37"
  spec.summary      = "ZCMacEasyLibrary Kit"
  spec.description  = "ZCMacEasyLibrary 拓展库+UI库"
  spec.platform     = :ios, '8.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.vendored_frameworks = 'Library/ZCMacEasyLibrary.framework'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
  spec.libraries    = 'z'

end
