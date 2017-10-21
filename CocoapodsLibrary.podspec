Pod::Spec.new do |spec|
  spec.name         = "CocoapodsLibrary"
  spec.version      = "1.0.2"
  spec.summary      = "CocoapodsLibrary All Kit"
  spec.description  = "代码集合"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => spec.version.to_s }
  spec.dependency   = 'ZCBannerView', :git => 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.dependency   = 'ZCSpinnerView', :git => 'https://github.com/zac-wang/CocoapodsLibrary.git'
  spec.dependency   = 'ZCCalendarView', :git => 'https://github.com/zac-wang/CocoapodsLibrary.git'
end
