//
//  NSString+ZCRegularRegex.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSString+ZCRegularRegex.h"
#import "NSDate+ZCSupp.h"

@implementation NSString (ZCRegularRegex)

- (BOOL)zc_regular:(NSString *)regularRegex {
    NSPredicate *regularTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularRegex];
    BOOL b = [regularTest evaluateWithObject:self];
    return b;
}

#pragma mark - 
- (BOOL)zc_isPhoneNumber {
//    NSString *regularRegex = @"^0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$";
    
    //移动
    //134(0-8)、135、136、137、138、139、147、148、150、151、152、157、158、159、178、182、183、184、187、188、198、1703、1705、1706、1440
    NSString *regularRegex = @"^0?(13[4-9]|14[78]|15[012789]|178|18[23478]|198)[0-9]{8}$";     //移动
    if([self zc_regular:regularRegex]) {
        NSLog(@"移动");
        return YES;
    }
    regularRegex = @"^0?(170[356])[0-9]{7}$";     //移动
    if([self zc_regular:regularRegex]) {
        NSLog(@"移动");
        return YES;
    }
    regularRegex = @"^0?1440[0-9]{7}$";           //移动-物联网号
    if([self zc_regular:regularRegex]) {
        NSLog(@"移动-物联网号");
        return YES;
    }
    
    //联通
    //130、131、132、145、146、155、156、166、171、175、176、185、186、1707、1708、1709
    regularRegex = @"^0?(13[0-2]|14[56]|15[56]|166|17[156]|18[56])[0-9]{8}$";           //联通
    if([self zc_regular:regularRegex]) {
        NSLog(@"联通");
        return YES;
    }
    regularRegex = @"^0?(170[7-9])[0-9]{7}$";     //联通
    if([self zc_regular:regularRegex]) {
        NSLog(@"联通");
        return YES;
    }
    
    //电信
    //133、1349、149、153、173、177、180、181、189、199、1410、1700、1701、1702、1740(0-5)
    regularRegex = @"^0?(133|149|153|17[37]|18[019]|199)[0-9]{8}$";   //电信
    if([self zc_regular:regularRegex]) {
        NSLog(@"电信");
        return YES;
    }
    regularRegex = @"^0?(1349|170[0-2])[0-9]{7}$";                    //电信
    if([self zc_regular:regularRegex]) {
        NSLog(@"电信");
        return YES;
    }
    regularRegex = @"^0?(1410)[0-9]{7}$";                             //电信-物联网号
    if([self zc_regular:regularRegex]) {
        NSLog(@"电信-物联网号");
        return YES;
    }
    regularRegex = @"^0?(1740[0-5])[0-9]{6}$";                        //电信-卫星专用
    if([self zc_regular:regularRegex]) {
        NSLog(@"电信-卫星专用");
        return YES;
    }
    
    return NO;
}

- (BOOL)zc_isEmail {
    NSString *regularRegex = @"^\\w+((\\-\\w+)|(\\.\\w+))*@[A-Za-z0-9]+((\\.|\\-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
    return [self zc_regular:regularRegex];
}

- (BOOL)zc_isNumber {
    NSScanner *scan = [NSScanner scannerWithString:self];
    double val;
    return [scan scanDouble:&val] && [scan isAtEnd];
}

- (BOOL)zc_isInt {
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)zc_isChinese {
    NSString *regularRegex = @"(^[\u4e00-\u9fa5]+$)";
    return [self zc_regular:regularRegex];
}

#pragma mark 银行卡号合法性
- (BOOL)zc_isBankCard {//luhn算法
    if(![self zc_isInt]) {
        return NO;
    }
    int oddSum = 0;     // 奇数和
    int evenSum = 0;    // 偶数和
    for (NSUInteger i = 0; i < self.length; i++){
        unsigned char theNumber = [self characterAtIndex:i];
        int lastNumber = theNumber - '0';
        if ((i+1)%2 == 0){ // 偶数位
            lastNumber *= 2;
            if (lastNumber > 9) {
                lastNumber -=9;
            }
            evenSum += lastNumber;
        }else { // 奇数位
            oddSum += lastNumber;
        }
    }
    int allSum = oddSum + evenSum;     // 总和
    if (allSum % 10 == 0){ // 是否合法
        return YES;
    }
    return NO;
}
    
#pragma mark - 身份证校验
- (BOOL)zc_isIDCard {
    if (self.zc_isIDCardNoVerifTime) {
        NSString *dateString = [self substringWithRange:NSMakeRange(6, 8)];
        NSDate *date = dateString.zc_toDate(@"yyyyMMdd");
        if(date.timeIntervalSinceNow < 0) {//判断时间是否为当前时间之前
            return YES;
        }
    }
    return NO;
}

- (BOOL)zc_isIDCardNoVerifTime {
    NSString *regularRegex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$|^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    if([self zc_regular:regularRegex] && self.length == 18) {
        NSString *validVerificationCode = self.zc_validVerificationCodeForIDCard;
        NSString *lastCode = [[self substringWithRange:NSMakeRange(17, 1)] uppercaseString];
        if ([validVerificationCode isEqualToString:lastCode]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark (根据算法)获取身份证最后一位
- (NSString *)zc_validVerificationCodeForIDCard {
    if (self.length != 18 && self.length != 17) {
        return  nil;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    
    if (![self substringToIndex:17].zc_isInt) {
        return nil;
    }
    
    int sumValue = 0;
    for (int i =0; i<17; i++) {
        int num = [self characterAtIndex:i] - '0';
        sumValue += num * [codeArray[i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d", sumValue % 11]];
    return  strlast;
}

- (int)zc_ageForIDCard {
    NSString *idCardNum = self;
    if(idCardNum.length > 14) {
        NSString *birthdayStr = [idCardNum substringWithRange:NSMakeRange(6, 8)];
        NSDate *birthday = birthdayStr.zc_toDate(@"yyyyMMdd");
        
        NSInteger age = (int)[NSDate date].zc_year - birthday.zc_year;
        if([NSDate date].zc_month < birthday.zc_month) {
            age -= 1;
        }else if([NSDate date].zc_month == birthday.zc_month) {
            //《最高人民法院关于审理未成年人刑事案件具体应用法律若干问题的解释》第二条明确规定，“周岁”，按照公历的年月日计算，从周岁生日的第二天起算
            if([NSDate date].zc_day <= birthday.zc_day) {
                age -= 1;
            }
        }
        return (int)age;
    }
    return -1;
}


#pragma mark -
- (NSArray<NSTextCheckingResult *> *)zc_getMatchingForRegular:(NSString *)regularRegex {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularRegex options:0 error:nil];
    NSArray *regularArr = [regularExpression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return regularArr;
}

- (NSArray<NSString *> *)zc_getOneMatchingForRegular:(NSString *)regularRegex {
    NSTextCheckingResult *match = [self zc_getMatchingForRegular:regularRegex].firstObject;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < match.numberOfRanges; i++) {
        NSRange rane = [match rangeAtIndex:i];
        NSString *string = [self substringWithRange:rane];
        [array addObject:string];
    }
    return array;
}

@end
