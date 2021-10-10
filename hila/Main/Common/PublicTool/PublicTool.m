//
//  PublicTool.m
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "PublicTool.h"
#import <CommonCrypto/CommonDigest.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/utsname.h>

@implementation PublicTool

#pragma mark ---获取设备ID


#pragma mark --获取手机型号
+ (NSString *)iphoneType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
}


#pragma mark 去掉float多余的0
+ (NSString *)changeFloat:(NSString *)stringFloat
{
    const char *floatChars = [stringFloat UTF8String];
    NSUInteger length = [stringFloat length];
    NSUInteger zeroLength = 0;
    int i = (int)length-1;
    for(; i>=0; i--)
    {
        if(floatChars[i] == '0'/*0x30*/) {
            zeroLength++;
        } else {
            if(floatChars[i] == '.')
                i--;
            break;
        }
    }
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    } else {
        returnString = [stringFloat substringToIndex:i+1];
    }
    return returnString;
}


#pragma mark 富文本显示
+ (NSMutableAttributedString *)attributes:(NSDictionary *)dict string:(NSString *)string {
    
    NSMutableAttributedString * contentAttributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:dict];
    
    NSMutableParagraphStyle * contentParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [contentAttributedString addAttribute:NSParagraphStyleAttributeName value:contentParagraphStyle range:NSMakeRange(0, [string length])];
    return contentAttributedString;
}


#pragma mark 十六进制颜色转grb
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

#pragma mark 获取要保留的小数点位数
+ (NSString *)getKde:(NSString *)tid {
    NSString *kde = @"2";
    //取出保存的group数据，找出该tid对应的kde，用来判断K线指标保留的小数点位数
    NSArray *groups = [XLArchiverHelper getObject:Market_QuotesGroup_Archive];
    if (groups.count > 0) {
        for (NSMutableDictionary *dic in groups) {
            NSArray *items = dic[@"items"];
            if (items.count > 0) {
                for (int i = 0; i < items.count; i++) {
                    NSMutableDictionary *itemDic = [items[i] mutableCopy];
                    if ([itemDic[@"tid"] isEqualToString:tid]) {
                        //避免接口的kde字段不存在或者kde字段的值为空，
                        if ([[itemDic allKeys] containsObject:@"kde"] && !([[itemDic[@"kde"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)) {
                            kde = [NSString stringWithFormat:@"%@",itemDic[@"kde"]];
                            break;
                        }else {
                            kde = @"2";
                            break;
                        }
                    }
                }
            }
        }
    }
    
    return kde;
}

#pragma mark 计算内容的宽高度
+ (CGFloat)caluContent:(NSString *)content Width:(BOOL)isWidth lineDic:(NSDictionary *)dict rectSize:(CGSize)size {
    
    CGSize contentSize = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    contentSize.width = ceil(contentSize.width) + 2;
    contentSize.height = ceil(contentSize.height)+2;
    
    if (isWidth) {
        return contentSize.width;
        
    }
    
    return contentSize.height;
}


/**
 *  判断当前时间是否处于某个时间段内
 *
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime currentTime:(NSString *)currentTime {
    if (kStringIsEmpty(startTime) && kStringIsEmpty(expireTime)) {
        return NO;
    }
    
    NSDate *today = [NSDate date];//默认当前时间
    
   
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // 时间格式,此处遇到过坑,建议时间HH大写,手机24小时进制和12小时禁止都可以完美格式化
    [dateFormat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    if (!kStringIsEmpty(currentTime)) {
        today = [dateFormat dateFromString:currentTime];
    }
    
    if (!kStringIsEmpty(startTime)) {
        
        NSDate *start = [dateFormat dateFromString:startTime];
        
        if (!([today compare:start] == NSOrderedDescending)){
            return NO;
        }
    }
    
    if (!kStringIsEmpty(expireTime)) {
        NSDate *expire = [dateFormat dateFromString:expireTime];
        
        if (!([today compare:expire] == NSOrderedAscending)) {
            return NO;
        }
        
    }
    
//    if ([today compare:start] == NSOrderedDescending && [today compare:expire] == NSOrderedAscending) {
//        return YES;
//    }
    return YES;
}

#pragma mark 获取当前时间
+ (UInt64) getCurrentTime
{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    return recordTime;
}

#pragma mark 判断是否是同一年
+ (BOOL)isSameYear:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return ([comp1 year] == [comp2 year]);
}
#pragma mark 判断是否是同一月
+ (BOOL)isSameMonth:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 month] == [comp2 month]) &&  ([comp1 year] == [comp2 year]));
}

#pragma mark 判断是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 month] == [comp2 month]) &&  ([comp1 year] == [comp2 year]) && ([comp1 day] == [comp2 day]));
}

#pragma mark 判断是否是同一小时
+ (BOOL)isSameHour:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && ([comp1 hour] == [comp2 hour]));
}

#pragma mark 判断是否是同一分钟
+ (BOOL)isSameMinute:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && ([comp1 hour] == [comp2 hour]) &&  ([comp1 minute] == [comp2 minute]));
}

#pragma mark 判断是否是同一周
+ (BOOL)isSameWeek:(NSDate *)date1 date2:(NSDate *)date2 {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = NSCalendarUnitWeekOfMonth | kCFCalendarUnitMonth;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 weekday] == [comp2 weekday]) && ([comp1 month] == [comp2 month]));
}


#pragma mark 判断是否在5分钟内
+ (BOOL)isSame5Minute:(NSDate *)date1 date2:(NSDate *)date2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && ([comp1 hour] == [comp2 hour]) &&  (([comp2 minute] - [comp1 minute]) < 5));
}

#pragma mark 判断是否在15分钟内
+ (BOOL)isSame15Minute:(NSDate *)date1 date2:(NSDate *)date2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && ([comp1 hour] == [comp2 hour]) &&  (([comp2 minute] - [comp1 minute]) < 15));
}
#pragma mark 判断是否在30分钟内
+ (BOOL)isSame30Minute:(NSDate *)date1 date2:(NSDate *)date2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && ([comp1 hour] == [comp2 hour]) &&  (([comp2 minute] - [comp1 minute]) < 30));
}

#pragma mark 判断是否在4小时内
+ (BOOL)isSame4Hour:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 year] == [comp2 year])&& ([comp1 month] == [comp2 month]) && ([comp1 day] == [comp2 day]) && (([comp2 hour] - [comp1 hour]) < 4));
}

//处理行情cname
+ (void)handleGroupArrArchiveCName:(NSArray *)dataArr {
    
    if (kArrayIsEmpty(dataArr)) {
        return;
    }
    
    for (int i = 0; i < dataArr.count; i++) {
        
        NSDictionary *dict = dataArr[i];
        NSArray *itemsArr = dict[@"items"];
        
        if (itemsArr.count > 0) {
            
            for (int j = 0; j < itemsArr.count; j++) {
                
                NSDictionary *itemDict = itemsArr[j];
                
                if (!kStringIsEmpty(itemDict[@"cname"])) {
                    [XLArchiverHelper setObject:itemDict[@"cname"] forKey:[NSString stringWithFormat:@"%@_%@",Market_QHJCNAME,itemDict[@"tid"]]];
                }
            }
        }
    }
}

#pragma mark 时间字符串转NSDate  格式:yyyy-MM-dd hh:mm:ss
+ (NSDate*)DateFromString:(NSString*)uiDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}


//时间戳字符串转换成 格式为 YYYY-MM-dd HH:mm:ss 时间字符串
+ (NSString *)timeStrWithTimeInterval:(NSUInteger)timeInterval{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
//    //设置时区,这个对于时间的处理有时很重要
//    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
//    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
//    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
//
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}



//根据日期判断是当天，当年   首席文章使用
+ (NSString *) compareCurrentTimeWithDayYear:(NSString *)str {
    
    //把字符串转为NSdate
    //    str = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    double releaseTimeStr = [timeDate timeIntervalSince1970];//发表的时间的时间戳
    double todayZeroTimeStr = [self getZeroWithTimeInterverl];//今天0点的时间戳
    NSString *current  = [dateFormatter stringFromDate:[NSDate date]];
    NSString *thisYear = [NSString stringWithFormat:@"%@-01-01 00:00:00",[[[current componentsSeparatedByString:@" "] firstObject] substringToIndex:4]];
    NSDate *this = [dateFormatter dateFromString:thisYear];
    double thisYearTimer = [this timeIntervalSince1970];//dangniankaishi
    double thistemp = thisYearTimer - releaseTimeStr;
    //得到与当前时间差
    
    //    NSTimeInterval timeInterval = [timeDate timeIntervalSinceNow];
    //
    //
    //
    //    timeInterval = -timeInterval;
    //
    //    long temp = 0;
    
    double temp = releaseTimeStr - todayZeroTimeStr;
    NSString *result;
    if (temp >= 0) {//当天发布
        result = [NSString stringWithFormat:@"%@",[[[str componentsSeparatedByString:@" "] lastObject] substringToIndex:5]];
    }else if (fabs(temp) <= 3600*24) {//昨天
        result = @"昨天";
        
    }else if (thistemp < 0) {//当年内
        
        result = [NSString stringWithFormat:@"%@",[[[str componentsSeparatedByString:@" "] firstObject] substringFromIndex:5]];
    }else {//一年前
        
        result = [NSString stringWithFormat:@"%@",[[str componentsSeparatedByString:@" "] firstObject]];
    }
    
    return result;
}

+ (double)getZeroWithTimeInterverl
{
    NSDate *originalDate = [NSDate date];
    NSDateFormatter *dateFomater = [[NSDateFormatter alloc]init];
    dateFomater.dateFormat = @"yyyy年MM月dd日";
    NSString *original = [dateFomater stringFromDate:originalDate];
    NSDate *ZeroDate = [dateFomater dateFromString:original];
    return [ZeroDate timeIntervalSince1970];
}


//获取url中的特定参数
+ (NSString *)getParamByKey:(NSString *)key URLString:(NSString *)url{

    NSError *error;
    NSString *regTags = [[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)", key];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags

                                                                          options:NSRegularExpressionCaseInsensitive

                                                                            error:&error];
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:url
                                      options:0
                                        range:NSMakeRange(0, [url length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [url substringWithRange:[match rangeAtIndex:2]];
        return tagValue;
    }
    return @"";
}


#pragma mark 使用md5加密字符串
+ (NSString*)getmd5WithString:(NSString *)string
{
    const char* original_str=[string UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, (uint)strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x", digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    return [outPutStr lowercaseString];
}

#pragma mark 获取用户信息

//+ (void)getUserInfo {
//
//    QHJUser *user = [QHJUser getCurrentUser];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setObject:user.zjID forKey:@"uid"];
//
//    NSString * jsonString = [UrlTool handleParamsPostDic:dict key:Root_Key token:Root_Token];
//    [NetRequestTool postWithUrlString:[NSString stringWithFormat:@"%@%@%@",RootUrl,UserApi,UserApi_GetUserInfo] parameters:jsonString success:^(id data){
//
//        NSString *getData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSString *enstring = [XLEncrytHelper newDesDecryptStr:getData key:Root_Key];
//        NSDictionary *tempDict = [enstring dictionaryWithJsonString:enstring];
//
//        if (!kDictIsEmpty(tempDict)) {
//            if ([tempDict[@"s"] integerValue] == 200) {
//
//                NSDictionary *userInfo = tempDict[@"d"];
//
//                QHJUser *user = [QHJUser mj_objectWithKeyValues:userInfo];
//                user.LoginState = YES;
//
//                //保存用户信息
//                [QHJUser saveUser:user];
//
//
//            }else {
//
//            }
//        }
//
//    }failure:^(NSError *error) {
//
//    }];
//
//    //渠道商
//    if ([user.role_level intValue] > 0) {
//        NSMutableDictionary *channelDict = [[NSMutableDictionary alloc]init];
//        [channelDict setObject:user.zjID forKey:@"uid"];
//
//        NSString * channeljsonString = [UrlTool handleParamsPostDic:channelDict key:Root_Key token:Root_Token];
//        [NetRequestTool postWithUrlString:[NSString stringWithFormat:@"%@%@%@",RootUrl,UserApi,UserApi_queryChannelInfo] parameters:channeljsonString success:^(id data){
//
//            NSString *getData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSString *enstring = [XLEncrytHelper newDesDecryptStr:getData key:Root_Key];
//            NSDictionary *tempDict = [enstring dictionaryWithJsonString:enstring];
//
//            if (!kDictIsEmpty(tempDict)) {
//                if ([tempDict[@"s"] integerValue] == 200) {
//
//                    NSDictionary *userInfo = tempDict[@"d"];
//                    [XLArchiverHelper setObject:userInfo forKey:[NSString stringWithFormat:@"%@_%@",Member_ChannelInfo,user.zjID]];
//
//
//                }else {
//
//                }
//            }
//
//        }failure:^(NSError *error) {
//
//        }];
//    }
//}


#pragma mark 处理报表链接
//+ (NSString *)handleChannelWebUrl:(NSString *)url {
//    
//    QHJUser *user = [QHJUser getCurrentUser];
//    
//    NSString *promoteID = [AccountManager sharedManager].promoteID;
//    NSString *uid = user.zjID;
//    NSString *phone = user.phone;
//    NSString *scode = user.safetyCode;
//    
//    //获取当前时间的秒数
//    NSDate *now = [NSDate date];
//    NSTimeInterval nowT  = [now timeIntervalSince1970]*1;
//    long long int date = (long long int)nowT;
//    NSString *time = [NSString stringWithFormat:@"%lld",date];
//
//    
//    NSString *params = [XLEncrytHelper md5:[NSString stringWithFormat:@"%@%@%@%@%@%@",uid,scode,phone,time,promoteID,Channel_Token]];
//    
//    if (!kStringIsEmpty(url)) {
//        NSURLComponents *components = [NSURLComponents componentsWithString:url];
//        NSMutableArray<NSURLQueryItem *> *queryItems = [components.queryItems mutableCopy];
//        if (!queryItems) {
//            queryItems = [[NSMutableArray alloc]init];
//        }
//        
//        NSURLQueryItem *promoteIDItem = [NSURLQueryItem queryItemWithName:@"promoteID" value:promoteID];
//        NSURLQueryItem *uidItem = [NSURLQueryItem queryItemWithName:@"uid" value:uid];
//        NSURLQueryItem *phoneItem = [NSURLQueryItem queryItemWithName:@"phone" value:phone];
//        NSURLQueryItem *scodeItem = [NSURLQueryItem queryItemWithName:@"scode" value:scode];
//        NSURLQueryItem *timeItem = [NSURLQueryItem queryItemWithName:@"t" value:time];
//        NSURLQueryItem *tokenItem = [NSURLQueryItem queryItemWithName:@"token" value:params];
//        
//        [queryItems addObject:promoteIDItem];
//        [queryItems addObject:uidItem];
//        [queryItems addObject:phoneItem];
//        [queryItems addObject:scodeItem];
//        [queryItems addObject:timeItem];
//        [queryItems addObject:tokenItem];
//        
//        components.queryItems = queryItems;
//        
//        NSURL *NewActionUrl =components.URL;
//        NSString *NewactionJump = [NewActionUrl absoluteString];
//        
//        return NewactionJump;
//    }
//    
//    return url;
//}


//+(void)viewControllerPushType:(NSInteger)typeInt action:(NSString *)action viewController:(UIViewController *)vc {
//    
//    if (typeInt == 100) {
//
//        QHJWebController *webViewC = [[QHJWebController alloc] initWithTitle:@"" URL:action withFlag:@"500"];
//        webViewC.hidesBottomBarWhenPushed = YES;
//        [vc.navigationController pushViewController:webViewC animated:YES];
//
//    }else if (typeInt == 200){//交易模块
//
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 2;
//
//    }else if (typeInt == 300){//文章详情
//
//        ArticleListModel *atricleListObj = [[ArticleListModel alloc]init];
//        atricleListObj.articleID = action;
//
//        ArticleDetailController *richTextVC = [[ArticleDetailController alloc]initWithArticleModel:atricleListObj];
//        [richTextVC setHidesBottomBarWhenPushed:YES];
//        [vc.navigationController pushViewController:richTextVC animated:YES];
//
//    }else if (typeInt == 400) {//资讯标签
//
//        [AccountManager sharedManager].indexTag = action;
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 3;
//    
//    }else if (typeInt == 500) {//快讯
//
//        [AccountManager sharedManager].pageIdx = 1;
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 3;
//
//    }else if (typeInt == 600) {//财经日历
//
//        [AccountManager sharedManager].pageIdx = 2;
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 3;
//
//    }else if (typeInt == 700){//实物黄金
//        
//        
//    }else if (typeInt == 800){//知识专区
//        
//        [AccountManager sharedManager].indexTag = action;
//        
//        KnowledgeController *knowVC = [[KnowledgeController alloc]init];
//        [knowVC setHidesBottomBarWhenPushed:YES];
//        [vc.navigationController pushViewController:knowVC animated:YES];
//        
//        
//    } else if (typeInt == 1100) {//T+D递延费
//        
//        ZJTDDeferController *deferVC = [[ZJTDDeferController alloc]init];
//        [deferVC setHidesBottomBarWhenPushed:YES];
//        deferVC.selectIdx = 1;
//        [vc.navigationController pushViewController:deferVC animated:YES];
//
//    }else if (typeInt == 1200) {//上金所行情
//        
//        [AccountManager sharedManager].pageIdx = 1;
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 1;
//        
//    }else if (typeInt == 1300) {//国际现货
//        
//        [AccountManager sharedManager].pageIdx = 2;
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 1;
//        
//    }else if (typeInt == 1400) {//交易模块
//        
//        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        TabBarController *root = (TabBarController *)delegate.window.rootViewController;
//        root.selectedIndex = 2;
//        
//    }else if (typeInt == 1500) {//客服
//       
//        QHJKefuController *kefuVC = [[QHJKefuController alloc]init];
//        [kefuVC setHidesBottomBarWhenPushed:YES];
//        [vc.navigationController pushViewController:kefuVC animated:YES];
//        
//    }else if (typeInt == 1600){//消息
//        
//        MessageController *messageVC = [[MessageController alloc]init];
//        [messageVC setHidesBottomBarWhenPushed:YES];
//        [vc.navigationController pushViewController:messageVC animated:YES];
//    }
//    
//}
@end
