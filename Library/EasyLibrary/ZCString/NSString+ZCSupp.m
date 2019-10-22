//
//  NSString+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSString+ZCSupp.h"

@implementation NSString (ZCSupp)

- (NSData *)zc_data {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)zc_urlParamSplit {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray *paramArray = [self componentsSeparatedByString:@"&"];
    for (NSString *param in paramArray) {
        NSArray *params = [param componentsSeparatedByString:@"="];
        if(params.count == 2) {
            dic[params.firstObject] = params.lastObject;
        }
    }
    return dic;
}

- (NSString *)zc_urlEncoded {
//    CFStringRef str = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8);
//    NSString *result = (NSString *)CFBridgingRelease(str);
    NSString *characters = @"!*'();:@&=+$,/?%#[]`^{}\"\\|<> ";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:characters].invertedSet;
    NSString *result = [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    return result;
}

- (NSString*)zc_urlDecoded {
//    CFStringRef str = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);
//    NSString *result = (NSString *)CFBridgingRelease(str);
//    NSString *result = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *result = [self stringByRemovingPercentEncoding];
    return result;
}

- (NSStringEncoding)zc_encoding {
    if([self canBeConvertedToEncoding:NSUTF8StringEncoding]){
        return NSUTF8StringEncoding;
    }
    
    const NSStringEncoding *encodings = [NSString availableStringEncodings];
    NSStringEncoding encoding;
    while ((encoding = *encodings++) != 0) {
        if([self canBeConvertedToEncoding:encoding]){
            return NSUTF8StringEncoding;
        }
    }
    return 0;
}

#pragma mark - 汉语拼音
- (NSString *)zc_pinyin {
    CFMutableStringRef string = (__bridge CFMutableStringRef)[NSMutableString stringWithString:self];
    if (CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO)) {
        if (CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO))
            return (__bridge NSString *)(string);
    }
    return @"";
    
}

@end
