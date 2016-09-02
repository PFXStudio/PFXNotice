//
//  NSDate+Formatter.m
//  CoconutClub
//
//  Created by PfxStudio on 14. 8. 3..
//  Copyright (c) 2014년 PfxStudio. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

- (NSString *)currentFormat
{
    NSUInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:unitFlags fromDate:self toDate:[NSDate date] options:0];
    
    long hour = [components hour];
    long minute = [components minute];
    long second = [components second];
    if (hour == 0 && minute == 0)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", second, NSLocalizedString(@"ss", nil), NSLocalizedString(@"before", nil)];
    }
    
    if (hour == 0)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", minute, NSLocalizedString(@"mm", nil), NSLocalizedString(@"before", nil)];
    }
    
    if (hour < 24)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", hour, NSLocalizedString(@"HHHH", nil), NSLocalizedString(@"before", nil)];
    }
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = [NSString stringWithFormat:@"yyyy%@ MM%@ dd%@", NSLocalizedString(@"yyyy", nil), NSLocalizedString(@"MM", nil), NSLocalizedString(@"dd", nil)];
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

- (NSString *)currentMessageFormat
{
    NSUInteger unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:unitFlags fromDate:self toDate:[NSDate date] options:0];
    
    long hour = [components hour];
    long minute = [components minute];
    long second = [components second];
    if (hour == 0 && minute == 0)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", second, NSLocalizedString(@"ss", nil), NSLocalizedString(@"before", nil)];
    }
    
    if (hour == 0)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", minute, NSLocalizedString(@"mm", nil), NSLocalizedString(@"before", nil)];
    }
    
    if (hour < 24)
    {
        return [NSString stringWithFormat:@"%ld%@ %@", hour, NSLocalizedString(@"HHHH", nil), NSLocalizedString(@"before", nil)];
    }
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = [NSString stringWithFormat:@"HH%@ mm%@", NSLocalizedString(@"HH", nil), NSLocalizedString(@"mm", nil)];
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}


- (NSString *)yyyyMMddFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = [NSString stringWithFormat:@"yyyy%@ MM%@ dd%@", NSLocalizedString(@"yyyy", nil), NSLocalizedString(@"MM", nil), NSLocalizedString(@"dd", nil)];
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

- (NSString *)yyyyMMddOfWeekFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = [NSString stringWithFormat:@"yyyy%@ MM%@ dd%@ EEEE", NSLocalizedString(@"yyyy", nil), NSLocalizedString(@"MM", nil), NSLocalizedString(@"dd", nil)];
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}


- (NSString *)yyyyMMddHyphenFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = @"yyyy-MM-dd";
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

- (NSString *)engMMddOfWeekFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = @"EEEE, MMMM dd";
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

- (NSString *)korMMddOfWeekFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString * dateFormat = [NSString stringWithFormat:@"MMMM dd%@ EEEE", NSLocalizedString(@"dd", nil)];
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

- (NSString *)hhmmFormat
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = @"h:mm";
    
    [dateFormatter setDateFormat:dateFormat];
    NSString * inputTime = [dateFormatter stringFromDate:self];
    return inputTime;
}

@end
