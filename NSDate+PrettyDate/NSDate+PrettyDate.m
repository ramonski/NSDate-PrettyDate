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
        if (comps.year == 1) return NSLocalizedString(@"last year", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d years ago", nil), comps.year];
    } else if (comps.month > 0) {
        // HANDLE MONTHS
        if (comps.month == 1) return NSLocalizedString(@"last month", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d months ago", nil), comps.month];
    } else if (comps.week > 0) {
        // HANDLE WEEKS
        if (comps.week == 1) return NSLocalizedString(@"last week", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d weeks ago", nil), comps.week];
    } else if (comps.day > 0) {
        // HANDLE DAYS
        if (comps.day == 1) return NSLocalizedString(@"yesterday", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d days ago", nil), comps.day];
    } else if (comps.hour > 0) {
        // HANDLE HOURS
        if (comps.hour == 1) return NSLocalizedString(@"last hour", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d hours ago", nil), comps.hour];
    } else if (comps.minute > 0) {
        // HANDLE MINUTES
        if (comps.minute == 1) return NSLocalizedString(@"a minute ago", nil);
        return [NSString stringWithFormat:NSLocalizedString(@"%d minutes ago", nil), comps.minute];
    } else if (comps.second < 30) {
        // HANDLE SECONDS
        return comps.second < 0 ? NSLocalizedString(@"future date", nil) : NSLocalizedString(@"just now", nil);
    }
    return [NSString stringWithFormat:NSLocalizedString(@"%d seconds ago", nil), comps.second];
}

- (NSString *)prettyDate2
{
    NSDateComponents *comps = [self getDateComponents];

    if (comps.year > 0) {
        // HANDLE YEARS
        if (comps.year == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one year and %d months ago", nil), comps.month];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d years and %d months ago", nil), comps.year, comps.month];
    } else if (comps.month > 0) {
        // HANDLE MONTHS
        if (comps.month == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one month and %d days ago", nil), comps.day];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d months and %d days ago", nil), comps.month, comps.day];
    } else if (comps.week > 0) {
        // HANDLE WEEKS
        if (comps.week == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one week and %d days ago", nil), comps.day];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d weeks and %d days ago", nil), comps.week, comps.day];
    } else if (comps.day > 0) {
        // HANDLE DAYS
        if (comps.day == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one day and %d hours ago", nil), comps.hour];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d days and %d hours ago", nil), comps.day, comps.hour];
    } else if (comps.hour > 0) {
        // HANDLE HOURS
        if (comps.hour == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one hour and %d minutes ago", nil), comps.minute];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d hours and %d minutes ago", nil), comps.hour, comps.minute];
    } else if (comps.minute > 0) {
        // HANDLE MINUTES
        if (comps.minute == 1) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"one minute and %d seconds ago", nil), comps.second];
        }
        return [NSString stringWithFormat:
                NSLocalizedString(@"%d minutes and %d seconds ago", nil), comps.minute, comps.second];
    } else if (comps.second < 30) {
        // HANDLE SECONDS
        return comps.second < 0 ? NSLocalizedString(@"future date", nil) : NSLocalizedString(@"a few seconds ago", nil);
    }
    return [NSString stringWithFormat:NSLocalizedString(@"%d seconds ago ...", nil), comps.second];
}

- (NSDateComponents *)getDateComponents
{
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit|NSWeekCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    return [sysCalendar components:unitFlags fromDate:self toDate:[NSDate date] options:0];
}

@end
