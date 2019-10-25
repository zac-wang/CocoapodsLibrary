//
//  ZCScanQRCode.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import "ZCScanQRCode.h"
#import <CoreImage/CoreImage.h>

@implementation ZCScanQRCode

+ (void)zc_scanQRCodeOnScreen:(void(^)(NSString *msg, CGRect bounds))block {
    /* displays[] Quartz display ID's */
    CGDirectDisplayID   *displays = nil;
    
    CGError             err = CGDisplayNoErr;
    CGDisplayCount      dspCount = 0;
    
    /* How many active displays do we have? */
    err = CGGetActiveDisplayList(0, NULL, &dspCount);
    
    /* If we are getting an error here then their won't be much to display. */
    if(err != CGDisplayNoErr)
    {
        NSLog(@"Could not get active display count (%d)\n", err);
        return;
    }
    
    /* Allocate enough memory to hold all the display IDs we have. */
    displays = calloc((size_t)dspCount, sizeof(CGDirectDisplayID));
    
    // Get the list of active displays
    err = CGGetActiveDisplayList(dspCount,
                                 displays,
                                 &dspCount);
    
    /* More error-checking here. */
    if(err != CGDisplayNoErr)
    {
        NSLog(@"Could not get active display list (%d)\n", err);
        return;
    }
    
    NSMutableArray* foundSSUrls = [NSMutableArray array];
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy:CIDetectorAccuracyHigh }];
    
    for (unsigned int displaysIndex = 0; displaysIndex < dspCount; displaysIndex++)
    {
        /* Make a snapshot image of the current display. */
        CGImageRef image = CGDisplayCreateImage(displays[displaysIndex]);
        NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image]];
        for (CIQRCodeFeature *feature in features) {
            //NSLog(@"%@, %@", feature.messageString, NSStringFromRect(NSRectFromCGRect(feature.bounds)));
            block(feature.messageString, feature.bounds);
            [foundSSUrls addObject:feature.messageString];
        }
    }
    
    free(displays);
}

@end
