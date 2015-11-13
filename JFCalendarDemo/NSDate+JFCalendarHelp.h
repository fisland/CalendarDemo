//
//  NSDate+JFCalendarHelp.h
//  CalendarDemo
//
//  Created by fisland on 15/11/11.
//  Copyright © 2015年 fisland. All rights reserved.
//

/**
 *  @author fisland, 15-11-11 03:48:23
 *
 *  @brief  日历帮助接口。
 */

#import <Foundation/Foundation.h>

@interface NSDate (JFCalendarHelp)
/**
 *  @author fisland, 15-11-11 03:49:35
 *
 *  @brief  本月日数
 *
 *  @return 当月日数
 */
+ (NSInteger)numberOfDaysInCurrentMonth;

/**
 *  @author fisland, 15-11-11 03:50:07
 *
 *  @brief  通过年月得出日数
 *
 *  @param year  年
 *  @param month 月
 *
 *  @return 日数
 */
+ (NSInteger)numberOfDaysByYear:(NSInteger )year month:(NSInteger)month;

/**
 *  @author fisland, 15-11-11 03:50:58
 *
 *  @brief  当前年份
 *
 *  @return 年份
 */
+ (NSInteger)currentYear;

/**
 *  @author fisland, 15-11-11 03:52:23
 *
 *  @brief  当前月份
 *
 *  @return 月份
 */
+ (NSInteger)currentMonth;

/**
 *  @author fisland, 15-11-11 03:52:37
 *
 *  @brief  当前日
 *
 *  @return 日
 */
+ (NSInteger)currentDay;

/**
 *  @author fisland, 15-11-11 06:19:19
 *
 *  @brief  当前周几
 *
 *  @return 周几
 */
+ (NSInteger)currentWeekday;

/**
 *  @author fisland, 15-11-12 04:33:41
 *
 *  @brief  通过年月得出当月第一天的周几
 *
 *  @param year  年
 *  @param month 月
 *
 *  @return 周几
 */
+ (NSInteger)firstWeekdayFromYear:(NSInteger)year month:(NSInteger)month;

/**
 *  @author fisland, 15-11-11 03:52:56
 *
 *  @brief  通过年月日算出星期几，从零开始，也就是星期日为0
 *
 *  @param year  年
 *  @param month 月
 *  @param day   日
 *
 *  @return 星期几
 */
+ (NSInteger)weekdayFromYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day;

/**
 *  @author fisland, 15-11-11 03:53:28
 *
 *  @brief  通过date算出星期几
 *
 *  @param inputDate date
 *
 *  @return 星期几
 */
+ (NSInteger)weekdayFromDate:(NSDate *)inputDate;
@end
