//
//  NSDate_PrettyDateTests.m
//  NSDate+PrettyDateTests
//
//  Created by Ramon Bartl on 19.05.13.
//  Copyright (c) 2013 Ramon Bartl. All rights reserved.
//

#import "NSDate_PrettyDateTests.h"
#import "NSDate+PrettyDate.h"

@implementation NSDate_PrettyDateTests {
    NSString *expects, *result;
}

- (void)setUp
{
    [super setUp];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testPrettyDateJustNow
{
    NSDate *date = [NSDate date];
    result = [date prettyDate];
    expects = @"just now";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

- (void)testPrettyDateSeconds
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-30];
    result = [date prettyDate];
    expects = @"30 seconds ago";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

- (void)testPrettyDateMinutes
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-60];
    result = [date prettyDate];
    expects = @"1 minutes ago";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

- (void)testPrettyDateHours
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-3600];
    result = [date prettyDate];
    expects = @"last hour";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

- (void)testPrettyDateYesterday
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-86400];
    result = [date prettyDate];
    expects = @"yesterday";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

- (void)testPrettyDateDays
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-172800];
    result = [date prettyDate];
    expects = @"2 days ago";
    STAssertTrue([result isEqualToString:expects], [NSString stringWithFormat:@"Expected '%@' got '%@'", expects, result]);
}

@end