# ZCEasyLibrary

##### 对iOS常用功能进行封装，提交开发效率，降低多项目的维护难度
Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :iOS, '8.0'

target 'TargetName' do
pod 'ZCEasyLibrary', '~>2.0.1'
end
```
代码使用示例

```
//无限滚动Banner
ZCBannerView *banerScrollView = [[ZCBannerView alloc] initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 200)];
[self.view addSubview:banerScrollView];
[self.banerScrollView zc_initBanner:[[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner.bundle"]];
self.banerScrollView.zc_selectImageView = ^(UIImageView *imgView, NSInteger index) {
    NSLog(@"您选中了第%ld张banner", (long)index);
};
```
```
//设置圆角
[view zc_drawCornerRadius:0 borderWidth:1 borderColor:UIColorFromRGB(0xa3b1c4)];
```
```
根据view样式生成对应的图片
UIImage *img = view.zc_screenCapture;
```

更多功能请查看framework头文件
