//
//  NSString+Common.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/21.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

+ (NSString *)UUID
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *)uuidStringRef;
}

#pragma mark - init string with data

+ (instancetype)stringWithUTF8Data:(NSData*)data
{
    NSString* string = [[self class] stringWithData:data usingEncoding:NSUTF8StringEncoding];
    return string;
}

+ (instancetype)stringWithData:(NSData*)data usingEncoding:(NSStringEncoding)encoding
{
    NSString* string = [[NSString alloc] initWithData:data encoding:encoding];
    return string;
}

#pragma mark - string methods

- (NSArray*)split:(NSString*)separator
{
    return [self componentsSeparatedByString:separator];
}

- (NSString*)replaceAll:(NSString*)target with:(NSString*)replacement
{
    return [self stringByReplacingOccurrencesOfString:target withString:replacement];
}

- (NSString*)substringFromIndex:(NSUInteger)begin toIndex:(NSUInteger)end
{
    if (end <= begin) {
        return nil;
    }
    NSRange range = NSMakeRange(begin, end - begin);
    return [self substringWithRange:range];
}

- (NSString*)stringByTrimmingNewLineCharacterSet
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (NSString*)stringByTrimmingWhiteAndNewLineCharacterSet
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)urlEncoded
{
    NSString *encoded = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                              (__bridge CFStringRef)self,
                                                                                              NULL,
                                                                                              (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                              kCFStringEncodingUTF8);
    return encoded;
}

- (NSString *)urlDecode {
    
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

- (NSString *)encodeStringWithUTF8
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)substringWithRegex:(NSString *)regex
{
    NSRegularExpression *regexExp = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    NSRange range = [regexExp rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if (range.location == NSNotFound) {
        return nil;
    } else {
        return [self substringWithRange:range];
    }
}

- (NSString *)reverse
{
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[self substringWithRange:subStrRange]];
    }
    
    return reversedString;
}

- (NSComparisonResult)compareTo:(NSString *)anotherString
{
    return [self compare:anotherString];
}

- (NSComparisonResult)compareToIgnoreCase:(NSString *)string
{
    return [self compare:string options:NSCaseInsensitiveSearch];
}

- (BOOL)contains:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    return (range.location != NSNotFound);
}

- (BOOL)startsWith:(NSString *)prefix
{
    return [self hasPrefix:prefix];
}

- (BOOL)endsWith:(NSString*)suffix
{
    return [self hasSuffix:suffix];
}

- (BOOL)equals:(NSString *)anotherString
{
    return [self isEqualToString:anotherString];
}

- (BOOL)equalsIgnoreCase:(NSString*)anotherString
{
    return ([self caseInsensitiveCompare:anotherString] == NSOrderedSame);
}

- (NSInteger)indexOfChar:(unichar)ch
{
    return [self indexOfChar:ch fromIndex:0];
}

- (NSInteger)indexOfChar:(unichar)ch fromIndex:(int)index
{
    int len = (int)self.length;
    for (int i = index; i < len; i++) {
        if (ch == [self characterAtIndex:i]) {
            return i;
        }
    }
    return NSNotFound;
}

- (NSInteger)indexOfString:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    
    return range.location;
}

- (NSInteger)indexOfString:(NSString *)string fromIndex:(int)index
{
    NSRange fromRange = NSMakeRange(index, self.length - index);
    NSRange range = [self rangeOfString:string options:NSLiteralSearch range:fromRange];
    
    return range.location;
}

- (NSInteger)lastIndexOfChar:(unichar)ch
{
    int len = (int)self.length;
    for (int i = len-1; i >=0; i--) {
        if ([self characterAtIndex:i] == ch) {
            return i;
        }
    }
    
    return NSNotFound;
}

- (NSInteger)lastIndexOfChar:(unichar)ch fromIndex:(int)index
{
    int len = (int)self.length;
    if (index >= len) {
        index = len - 1;
    }
    for (int i = index; i >= 0; i--) {
        if ([self characterAtIndex:i] == ch) {
            return index;
        }
    }
    
    return NSNotFound;
}

- (NSInteger)lastIndexOfString:(NSString *)string
{
    NSRange range = [self rangeOfString:string options:NSBackwardsSearch];
    
    return range.location;
}

- (NSInteger)lastIndexOfString:(NSString *)string fromIndex:(int)index
{
    NSRange fromRange = NSMakeRange(0, index);
    NSRange range = [self rangeOfString:string options:NSBackwardsSearch range:fromRange];
    
    return range.location;
}

#pragma mark - validate file name, email, mobile

- (BOOL)isValidFileName
{
    NSCharacterSet* characterSet = [NSCharacterSet characterSetWithCharactersInString:@"\\/:*?\"<>|"];
    NSRange range = [self rangeOfCharacterFromSet:characterSet];
    return range.location == NSNotFound;
}

- (BOOL)isValidEmailAddress
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailPredicate evaluateWithObject:self];
}

/*手机号码验证 MODIFIED BY HELENSONG*/
- (BOOL)isValidMobileNumber
{
    //手机号以13，14，15，17，18开头，九个 \d 数字字符
    NSString *phoneRegex = @"^((13)|(14)|(15)|(17)|(18))\\d{9}$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phonePredicate evaluateWithObject:self];
}

//url
- (BOOL)isURLRegular{
    
    NSString *urlRegular = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegular
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];

    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [self substringWithRange:match.range];
        return YES;
    }
    return NO;
}

#pragma mark -- nil string
///返回非nil字符串，为nil则返回@""
- (NSString *)nonilString
{
    return self ? self : @"";
}

///判断是否为nil、NULL、@“”
+ (BOOL)isNil:(NSString *)string
{
    BOOL isNil = NO;
    if (!string)
    {
        isNil = YES;
    }
    else if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@""])
    {
        isNil = YES;
    }
    else if ([string isEqual:[NSNull null]])
    {
        isNil = YES;
    }
    
    return isNil;
}

#pragma mark - pinyin

//- (NSString *)pinYin
//{
//    HanyuPinyinOutputFormat *outputFormat = [[HanyuPinyinOutputFormat alloc] init];
//    [outputFormat setToneType:ToneTypeWithoutTone];
//    [outputFormat setVCharType:VCharTypeWithV];
//    [outputFormat setCaseType:CaseTypeLowercase];
//
//    NSString *outputPinyin = [PinyinHelper toHanyuPinyinStringWithNSString:self
//                                               withHanyuPinyinOutputFormat:outputFormat
//                                                              withNSString:@""];
//    return outputPinyin;
//}
//
//- (NSString *)jianPin
//{
//    HanyuPinyinOutputFormat *outputFormat = [[HanyuPinyinOutputFormat alloc] init];
//    [outputFormat setToneType:ToneTypeWithoutTone];
//    [outputFormat setVCharType:VCharTypeWithV];
//    [outputFormat setCaseType:CaseTypeLowercase];
//
//    NSString *outputPinyin = [PinyinHelper toHanyuPinyinStringWithNSString:self
//                                               withHanyuPinyinOutputFormat:outputFormat
//                                                              withNSString:@" "];
//
//    NSArray *array = [outputPinyin componentsSeparatedByString:@" "];
//    NSMutableArray *firstLetters = [[NSMutableArray alloc] init];
//    for (NSString *string in array) {
//        if (string && string.length >= 1) {
//            [firstLetters addObject:[string substringToIndex:1]];
//        }
//    }
//
//    return [firstLetters componentsJoinedByString:@""];
//}

#pragma mark - to date

- (NSDate *)toDateWithFormatter:(NSString *)formatter
{
    if (self.length == 0) {
        return nil;
    }
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
    }
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:self];
}

- (NSDate *)toDate;
{
    return [self toDateWithFormatter:@"yyyy-MM-dd"];
}

- (NSDate *)toDateTime;
{
    return [self toDateWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSDate *)toFullDateTime;
{
    return [self toDateWithFormatter:@"yyyy-MM-dd HH:mm:ss zzz"];
}

- (NSDate *)toTime;
{
    return [self toDateWithFormatter:@"HH:mm:ss"];
}

#pragma mark - encrypt & decrypt


- (NSString *)md5String16:(NSString *)srcString
{
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String=[self md5String32:srcString];
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    
    return result;
}

/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
- (NSMutableDictionary *)getURLParameters:(NSString *)urlStr {
    // 查找参数
    NSRange range = [urlStr rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    // 截取参数
    NSString *parametersString = [urlStr substringFromIndex:range.location + 1];
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}


//计算富文本的高度
-(CGSize)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
//    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.2f
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

@end
