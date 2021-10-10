//
//  PublicTool.h
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PublicTool : NSObject

#pragma mark ---获取设备ID
+ (NSString *)deviceId;

+ (NSString *)iphoneType;

#pragma mark 去掉float多余的0
+ (NSString *)changeFloat:(NSString *)stringFloat;

#pragma mark 富文本显示
+ (NSMutableAttributedString *)attributes:(NSDictionary *)dict string:(NSString *)string;

#pragma mark 颜色（含alpha）
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

#pragma mark 获取要保留的小数点位数
+ (NSString *)getKde:(NSString *)tid;

#pragma mark 计算内容的宽高度
+ (CGFloat)caluContent:(NSString *)content Width:(BOOL)isWidth lineDic:(NSDictionary *)dict rectSize:(CGSize)size;

/**
 *  判断某个时间是否处于某个时间段内
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */

+ (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime currentTime:(NSString *)currentTime;

#pragma mark 获取当前时间
+ (UInt64) getCurrentTime;

#pragma mark 判断是否是同一年
+ (BOOL)isSameYear:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否是同一月
+ (BOOL)isSameMonth:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否是同一小时
+ (BOOL)isSameHour:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否是同一分钟
+ (BOOL)isSameMinute:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否是同一周
+ (BOOL)isSameWeek:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否在5分钟内
+ (BOOL)isSame5Minute:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否在15分钟内
+ (BOOL)isSame15Minute:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark 判断是否在30分钟内
+ (BOOL)isSame30Minute:(NSDate *)date1 date2:(NSDate *)date2;

+ (BOOL)isSame4Hour:(NSDate *)date1 date2:(NSDate *)date2;

//处理行情cname
+ (void)handleGroupArrArchiveCName:(NSArray *)dataArr;

#pragma mark 时间字符串转NSDate  格式:yyyy-MM-dd hh:mm:ss
+ (NSDate*)DateFromString:(NSString*)uiDate;


//时间戳字符串转换成 格式为 YYYY-MM-dd HH:mm:ss 时间字符串
+ (NSString *)timeStrWithTimeInterval:(NSUInteger)timeInterval;

+ (NSString *) compareCurrentTimeWithDayYear:(NSString *)str;

+ (double)getZeroWithTimeInterverl;

//获取url中的特定参数
+ (NSString *)getParamByKey:(NSString *)key URLString:(NSString *)url;


#pragma mark 使用md5加密字符串
+ (NSString*)getmd5WithString:(NSString *)string;


#pragma mark 获取用户信息
//+ (void)getUserInfo;

#pragma mark 处理报表链接
//+ (NSString *)handleChannelWebUrl:(NSString *)url;


//+ (void)viewControllerPushType:(NSInteger)typeInt action:(NSString *)action viewController:(UIViewController *)vc;
@end


