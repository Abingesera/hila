//
//  NSDate+Common.h
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/30.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Common)


- (NSString *)toStringWithFormatter:(NSString *)formatter;
- (NSString *)toDateString;
- (NSString *)toDateTimeString;
- (NSString *)toTimeString;
- (NSString *)toFullDateTimeString;

+ (void)setFirtWeekday:(NSUInteger)firstWeekday;
+ (void)setCalendar:(NSCalendar *)calendar;

- (NSDate *)dateWithUnitFlags:(NSCalendarUnit)unitFlags;

- (NSDateComponents *)dateComponents;
- (NSDateComponents *)dateComponentsWithUnitFlags:(NSCalendarUnit)unitFlags;
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)week;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;
- (NSInteger)weekday;

- (NSDate *)dateByAppendingDateComponents:(NSDateComponents *)dateComponents;
- (NSDate *)dateByAppendingYear:(NSInteger)year;
- (NSDate *)dateByAppendingMonth:(NSInteger)month;
- (NSDate *)dateByAppendingWeek:(NSInteger)week;
- (NSDate *)dateByAppendingDay:(NSInteger)day;
- (NSDate *)dateByAppendingHour:(NSInteger)hour;
- (NSDate *)dateByAppendingMinute:(NSInteger)minute;
- (NSDate *)dateByAppendingSecond:(NSInteger)second;

- (NSDateComponents *)dateComponentsToDate:(NSDate *)anotherDate;
- (NSDateComponents *)dateComponentsToDate:(NSDate *)anotherDate withUnitFlags:(NSCalendarUnit)unitFlags;
- (NSInteger)yearToDate:(NSDate *)anotherDate;
- (NSInteger)monthToDate:(NSDate *)anotherDate;
- (NSInteger)weekToDate:(NSDate *)anotherDate;
- (NSInteger)dayToDate:(NSDate *)anotherDate;
- (NSInteger)hourToDate:(NSDate *)anotherDate;
- (NSInteger)minuteToDate:(NSDate *)anotherDate;
- (NSInteger)secondToDate:(NSDate *)anotherDate;

@end
