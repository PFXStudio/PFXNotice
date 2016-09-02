//
//  NSDate+Custom.m
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import "NSDate+Custom.h"

@implementation NSDate (Custom)

- (NSString *)toString
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat: @"yyyy년 MM월 dd일"];
    
    return [formatter stringFromDate:self];
}

+ (instancetype)dateWithoutTime
{
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

- (BOOL)isEqualWithoutTimeToDate:(NSDate *)otherDate
{
    NSDateComponents *sourceComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    NSDateComponents *targetComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:otherDate];
    
    if ([sourceComponents year] == [targetComponents year] &&
        [sourceComponents day] == [targetComponents day] &&
        [sourceComponents month] == [targetComponents month])
    {
        return YES;
    }

    return NO;
}

@end
