Pod::Spec.new do |spec|
  spec.name         = "ZCCalendarView"
  spec.version      = "2.0.1"
  spec.summary      = "ZCCalendarView UI Kit"
  spec.description  = "ZCCalendarView 这是一个可自定义样式日历"
  spec.platform     = :ios, '7.0'
  spec.license      = { :type => 'Copyright', :text => 'Zac Inc. 2017' }
  spec.homepage     = 'https://github.com/zac-wang/CocoapodsLibrary'
  spec.author       = {'王志超' => 'love_iphone@qq.com'}
  spec.source       =  {:git => 'https://github.com/zac-wang/CocoapodsLibrary.git', :tag => 'cal2.0.0' }
  spec.source_files = 'Library/ZCCalendarView/**/*.{h,m,c,mm}'
  spec.public_header_files = 'Library/ZCCalendarView/**/*.{h}'
  spec.private_header_files = 'Library/ZCCalendarView/date/ZCCalendarDateLunarCalendar.h'
  spec.requires_arc = true
  spec.frameworks   = 'Foundation', 'UIKit'
  spec.ios.dependency 'ZCEasyLibrary', '>= 2.0.0'
end
