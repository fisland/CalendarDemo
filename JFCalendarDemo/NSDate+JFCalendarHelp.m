//
//  NSDate+JFCalendarHelp.m
//  CalendarDemo
//
//  Created by fisland on 15/11/11.
//  Copyright © 2015年 fisland. All rights reserved.
//

#import "NSDate+JFCalendarHelp.h"

@implementation NSDate (JFCalendarHelp)
+ (NSInteger)numberOfDaysInCurrentMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}

+ (NSInteger)currentYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSInteger currentYear = components.year;
    
    return currentYear;
}

+ (NSInteger)currentMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSInteger currentMonth = components.month;
    
    return currentMonth;
}

+ (NSInteger)currentDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSInteger currentDay = components.day;
    
    return currentDay;
}

+ (NSInteger)currentWeekday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    
    NSInteger currentWeekday = components.weekday;
    
    return currentWeekday;
}

+ (NSInteger)weekdayFromDate:(NSDate *)inputDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:inputDate];
    
    NSInteger currentWeekday = components.weekday;
    
    return currentWeekday;
}


+ (NSInteger)weekdayFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    
    NSString *dateString = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [format dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    NSInteger currentWeekday = components.weekday -1 ;
    
    return currentWeekday;
}

+ (NSInteger)firstWeekdayFromYear:(NSInteger)year month:(NSInteger)month{
    
    NSString *dateString = [NSString stringWithFormat:@"%ld-%ld-%d",year,month,1];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [format dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    NSInteger currentWeekday = components.weekday -1 ;
    
    return currentWeekday;
}

+ (NSInteger)numberOfDaysByYear:(NSInteger )year month:(NSInteger)month{
    NSArray *array = @[@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31"];
    NSMutableArray *days = [NSMutableArray arrayWithArray:array];
    if (2 == month && 0 == (year % 4) &&(0 != (year % 100) || 0 == (year % 400))) {
        days[1] = @"28";
    }
    
    NSString *dayString = days[month -1];
    return [dayString integerValue];
}

@end
