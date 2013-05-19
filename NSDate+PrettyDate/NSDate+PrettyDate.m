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
        return NSLocalizedString(@"just now", nil);
    }
    return [NSString stringWithFormat:NSLocalizedString(@"%d seconds ago", nil), comps.second];
}

- (NSDateComponents *)getDateComponents
{
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit|NSWeekCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    return [sysCalendar components:unitFlags fromDate:self toDate:[NSDate date] options:0];
}

@end