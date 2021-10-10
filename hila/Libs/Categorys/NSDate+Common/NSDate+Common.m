//
//  NSDate+Common.m
//  NewHoldGold
//
//  Created by zsgjs on 2017/11/30.
//  Copyright © 2017年 掌金. All rights reserved.
//

#import "NSDate+Common.h"
@implementation NSDate (Common)

static NSUInteger globalFirstWeekday;
static NSCalendar *globalCalendar = nil;

static const unsigned componentFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSWeekCalendarUnit |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);

__attribute__((constructor))
static void initialize_firstWeekday()
{
    globalFirstWeekday = 1;
}

__attribute__((constructor))
static void initialize_calendar()
{
    globalCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    globalCalendar.firstWeekday = globalFirstWeekday;
}

__attribute__((destructor))
static void destroy_firstWeekday()
{
    
}

__attribute__((destructor))
static void destroy_calendar()
{
    globalCalendar = nil;
}

- (NSString *)toStringWithFormatter:(NSString *)formatter
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    [dateFormatter setDateFormat:formatter];
    
    return [dateFormatter stringFromDate:self];
}

- (NSString *)toDateString
{
    return [self toStringWithFormatter:@"yyyy-MM-dd"];
}

- (NSString *)toDateTimeString
{
    return [self toStringWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)toTimeString
{
//    return [self toStringWithFormatter:@"HH:mm"];
    return [self toStringWithFormatter:@"HH:mm:ss"];
}

- (NSString *)toFullDateTimeString
{
    return [self toStringWithFormatter:@"yyyy-MM-dd HH:mm:ss zzz"];
}

+ (void)setFirtWeekday:(NSUInteger)firstWeekday
{
    globalFirstWeekday = firstWeekday;
    globalCalendar.firstWeekday = firstWeekday;
}

+ (void)setCalendar:(NSCalendar *)calendar
{
    globalCalendar = calendar;
}

- (NSDate *)dateWithUnitFlags:(NSCalendarUnit)unitFlags
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:unitFlags];
    
    return [globalCalendar dateFromComponents:components];
}

- (NSDateComponents *)dateComponents
{
    return [self dateComponentsWithUnitFlags:componentFlags];
}

- (NSDateComponents *)dateComponentsWithUnitFlags:(NSCalendarUnit)unitFlags
{
    NSDateComponents *components = [globalCalendar components:unitFlags fromDate:self];
    
    return components;
}

- (NSInteger)year
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitYear];
    
    return components.year;
}

- (NSInteger)month
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitMonth];
    
    return components.month;
}

- (NSInteger)week
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSWeekCalendarUnit];
    
    return components.week;
}

- (NSInteger)day
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitDay];
    
    return components.day;
}

- (NSInteger)hour
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitHour];
    
    return components.hour;
}

- (NSInteger)minute
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitMinute];
    
    return components.minute;
}

- (NSInteger)second
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitSecond];
    
    return components.second;
}

- (NSInteger)weekday
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:NSCalendarUnitWeekday];
    
    return components.weekday;
}

- (NSDate *)dateByAppendingDateComponents:(NSDateComponents *)dateComponents
{
    return [globalCalendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)dateByAppendingYear:(NSInteger)year
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.year = year;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingMonth:(NSInteger)month
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.month = month;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingWeek:(NSInteger)week
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.weekday = week;
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingDay:(NSInteger)day
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.day = day;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingHour:(NSInteger)hour
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.hour = hour;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingMinute:(NSInteger)minute
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.minute = minute;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAppendingSecond:(NSInteger)second
{
    NSDateComponents *components = [self dateComponentsWithUnitFlags:componentFlags];
    components.second = second;
    
    return [globalCalendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDateComponents *)dateComponentsToDate:(NSDate *)anotherDate
{
    return [self dateComponentsToDate:anotherDate withUnitFlags:componentFlags];
}

- (NSDateComponents *)dateComponentsToDate:(NSDate *)anotherDate withUnitFlags:(NSCalendarUnit)unitFlags
{
    NSDate *fromDate;
    NSDate *toDate;
    [globalCalendar rangeOfUnit:unitFlags startDate:&fromDate
                       interval:NULL forDate:self];
    [globalCalendar rangeOfUnit:unitFlags startDate:&toDate
                       interval:NULL forDate:anotherDate];
    
    NSDateComponents *components = [globalCalendar components:unitFlags fromDate:fromDate toDate:toDate options:0];
    return components;
}

- (NSInteger)yearToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitYear];
    
    return components.year;
}

- (NSInteger)monthToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitMonth];
    return components.month;
}

- (NSInteger)weekToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitWeekday];
    return components.weekday;
}

- (NSInteger)dayToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitDay];
    
    return components.day;
}

- (NSInteger)hourToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitHour];
    
    
    return components.hour;
}

- (NSInteger)minuteToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitMinute];
    
    return components.minute;
}

- (NSInteger)secondToDate:(NSDate *)anotherDate
{
    NSDateComponents *components = [self dateComponentsToDate:anotherDate withUnitFlags:NSCalendarUnitSecond];
    
    return components.second;
}

@end
