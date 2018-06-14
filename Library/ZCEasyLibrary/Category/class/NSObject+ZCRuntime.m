//
//  NSObject+ZCRuntime.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/11/3.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSObject+ZCRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (ZCRuntime)

#pragma mark -
- (void)zc_setDynamicValue:(id)value forKey:(NSString *)key {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)zc_dynamicValueForKey:(NSString *)key {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
}

#pragma mark -
- (NSArray<NSString *> *)zc_catProperty:(void (^)(NSString *, NSString *))zc_catProperty {
    NSMutableArray *propertyNameArray = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *pros = class_copyPropertyList([self class], &count);
    for(int i = 0; i < count; i++){
        objc_property_t pro = pros[i];
        char *classType = property_copyAttributeValue(pro, "T");
        NSString *type = [self getPropertyClass:classType];
        free(classType);
        //char *onleRead = property_copyAttributeValue(pro, "R");
        //free(onleRead);
        
        const char *name = property_getName(pro);
        NSString *string = [NSString stringWithUTF8String:name];
        [propertyNameArray addObject:string];
        zc_catProperty(string, type);
    }
    free(pros);
    
    return propertyNameArray;
}

- (void)zc_setProperty:(NSString *)key value:(id)value {
    [self setValue:value forKey:key];
}

- (NSString *)getPropertyClass:(const char *)typeEncoding{
    NSString *type = [NSString stringWithFormat:@"%c", typeEncoding[0]];
    if([type isEqualToString:@"@"]) {
        NSString *name = @(typeEncoding);
        if([name hasPrefix:@"@\""] && [name hasSuffix:@"\""]){
            NSString *nameAndProtocol = [name substringWithRange:NSMakeRange(2, name.length-3)];
            nameAndProtocol = [nameAndProtocol stringByAppendingString:@"*"];
            return nameAndProtocol;
        }
    }else {
        NSDictionary *typeDictionary = @{
                                         @"c":@"char",
                                         @"C":@"unsigned char",
                                         @"i":@"int",
                                         @"I":@"unsigned int",
                                         @"s":@"short",
                                         @"S":@"unsigned short",
                                         @"l":@"long",
                                         @"L":@"unsigned long",
                                         @"q":@"long long",
                                         @"Q":@"unsigned long long",
                                         @"f":@"float",
                                         @"d":@"double",
                                         @"B":@"bool",
                                         @"*":@"char*", // C-String
                                         @"@":@"Object", // Object
                                         @"{":@"struct", // Struct
                                         @"[":@"C-Array", // C-Array
                                         @"(":@"Enum", // Enum
                                         @"#":@"Class", // Class
                                         @":":@"Selector", // Selector
                                         @"^":@"Pointer", // Pointer, 函数指针 ^i【int*】
                                         @"b":@"Bitfield", // Bitfield
                                         @"?":@"Block"
                                         };
        return typeDictionary[type];
    }
    return nil;
}

#pragma mark -

@end
