//
//  NSDate+PrettyDate.m
//  NSDate+PrettyDate
//
//  Created by Ramon Bartl on 19.05.13.
//  Copyright (c) 2013 Ramon Bartl. All rights reserved.
//

#import "NSDate+PrettyDate.h"

@implementation NSDate (PrettyDate)


- (NSString *)prettyDate
{
    NSDateComponents *comps = [self getDateComponents];

    if (comps.year > 0) {
        // HANDLE YEARS
        if (comps.year == 1) return @"last year";
        return [NSString stringWithFormat:@"%d years ago", comps.year];
    } else if (comps.month > 0) {
        // HANDLE MONTHS
        if (comps.month == 1) return @"last month";
        return [NSString stringWithFormat:@"%d months ago", comps.month];
    } else if (comps.week > 0) {
        // HANDLE WEEKS
        if (comps.week == 1) return @"last week";
        return [NSString stringWithFormat:@"%d weeks ago", comps.week];
    } else if (comps.day > 0) {
        // HANDLE DAYS
        if (comps.day == 1) return @"yesterday";
        return [NSString stringWithFormat:@"%d days ago", comps.day];
    } else if (comps.hour > 0) {
        // HANDLE HOURS
        if (comps.hour == 1) return @"last hour";
        return [NSString stringWithFormat:@"%d hours ago", comps.hour];
    } else if (comps.minute > 0) {
        // HANDLE MINUTES
        return [NSString stringWithFormat:@"%d minutes ago", comps.minute];
    } else if (comps.second < 30) {
        // HANDLE SECONDS
        return @"just now";
    }
    return [NSString stringWithFormat:@"%d seconds ago", comps.second];
}

- (NSDateComponents *)getDateComponents
{
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit|NSWeekCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    return [sysCalendar components:unitFlags fromDate:self toDate:[NSDate date] options:0];
}

@end