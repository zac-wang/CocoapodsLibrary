//
//  ZCDragImageView.m
//  test
//
//  Created by wzc on 2020/6/4.
//  Copyright © 2020 wzc. All rights reserved.
//

#import "ZCDragImageView.h"

@interface ZCDragImageView() <NSDraggingSource, NSPasteboardItemDataProvider>
@end

@implementation ZCDragImageView

//是否必须是活动窗口才能拖拽，YES非活动窗口也能拖拽，NO必须是活动窗口才能拖拽
- (BOOL)acceptsFirstMouse:(NSEvent *)event {
     return YES;
}

// 用户鼠标点击 NSView/NSWindow 触发 mouseDown: 事件, 调用 beginDraggingSessionWithItems 方法
// 开始建立一个拖放的session, 开始启动拖放过程。
- (void)mouseDown:(NSEvent*)event {
    /// 使用 NSPasteboardItem 定义拖放携带的基本数据信息
    NSPasteboardItem *pbItem = [[NSPasteboardItem alloc] init];
    
    /// 设置代理，定义哪些类型拖拽的时候会执行 NSPasteboardItemDataProvider 的代理方法
    [pbItem setDataProvider:self forTypes:@[NSPasteboardTypeString, NSPasteboardTypePNG]];

    /// 用 NSDraggingItem 包装 NSPasteboardItem
    NSDraggingItem *dragItem = [[NSDraggingItem alloc] initWithPasteboardWriter:pbItem];
    
    {
        NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"1.png"];
        NSURL *url = [NSURL fileURLWithPath:path];
        [self.image.TIFFRepresentation writeToURL:url atomically:YES];
        if (@available(macOS 10.13, *)) {
            [pbItem setString:url.absoluteString forType:NSPasteboardTypeFileURL];
        } else {
            [pbItem setString:url.absoluteString forType:@"public.file-url"];
        }
//        //多文件时
//        [pasteboard setPropertyList:@[] forType:NSFilenamesPboardType];
//
//        // 纯文本
//        [pbItem setString:@"hello world！" forType:NSPasteboardTypeString];
    }
    
    /// 拖放可视化定义, 定义拖放过程中的跟随鼠标移动的图像
    [dragItem setDraggingFrame:self.bounds contents:self.image];
    /// 建立一个拖放的 session
    NSDraggingSession *draggingSession = [self beginDraggingSessionWithItems:@[dragItem] event:event source:self];
    
    /// 拖拽失败后是否返回动画，YES有动画，NO无动画
    draggingSession.animatesToStartingPositionsOnCancelOrFail = YES;
//    draggingSession.draggingFormation = NSDraggingFormationNone;
}

#pragma mark - NSDraggingSource
//设置接收拖拽的目的地的图标样式
- (NSDragOperation)draggingSession:(NSDraggingSession *)session sourceOperationMaskForDraggingContext:(NSDraggingContext)context {
    switch (context) {
        case NSDraggingContextOutsideApplication://app外
            return NSDragOperationCopy;
        case NSDraggingContextWithinApplication://app内
            return NSDragOperationNone;
        default://其余情况
            return NSDragOperationNone;
            break;
    }
}

#pragma mark -- NSPasteboardItemDataProvider

- (void)pasteboard:(nullable NSPasteboard *)pasteboard item:(NSPasteboardItem *)item provideDataForType:(NSString *)type {
}

// 松手，删除临时文件
-(void)draggingSession:(NSDraggingSession *)session endedAtPoint:(NSPoint)screenPoint operation:(NSDragOperation)operation {
    // 松手了，但是可能提示用户已存在同名文件，需要选择替换；如果立即删除，用户操作后，才会触发拷贝，但文件已不存在
    // 也可以通过动态生成文件名来保证不会出现同名问题，但也可能出现权限提示框……
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        sleep(10);
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSString *path = [session.draggingPasteboard stringForType:@"public.file-url"];
            [[NSFileManager defaultManager] removeItemAtURL:[NSURL URLWithString:path] error:nil];
        });
    });
}

@end
