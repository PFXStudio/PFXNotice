//
//  NSString+Custom.m
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)

- (BOOL)isValidEmail
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidOnlyChracters
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@":/?&=;+!@#$()',*"];
    return [self rangeOfCharacterFromSet:characterSet].location != NSNotFound ? NO : YES;
}

- (BOOL)isValidInteger
{
    NSScanner *ns = [NSScanner scannerWithString:self];
    NSInteger value;
    if ([ns scanInteger:& value] == YES)
    {
        return YES;
    }
    
    return NO;
}

- (NSInteger)converToInteger
{
    NSScanner *ns = [NSScanner scannerWithString:self];
    NSInteger value;
    if ([ns scanInteger:& value] == YES)
    {
        return value;
    }
    
    return NSIntegerMax;
}

- (NSArray *)jsonStringToArray
{
    NSString *output = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSMutableArray *outDatas = [NSJSONSerialization JSONObjectWithData:[output dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:& error];
    if (error != nil)
    {
        return nil;
    }
    
    return outDatas;
}

- (NSDictionary *)jsonStringToDictionary
{
    NSString *output = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSMutableDictionary *outDatas = [NSJSONSerialization JSONObjectWithData:[output dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:& error];
    if (error != nil)
    {
        return nil;
    }
    
    return outDatas;
}

+ (NSString *)stringWithInteger:(NSInteger)value
{
    return [NSString stringWithFormat:@"%ld", (long)value];
}

+ (NSString *)stringWithFloat:(CGFloat)value
{
    return [NSString stringWithFormat:@"%f", value];
}

+ (NSString *)stringWithLongLong:(long long)value
{
    return [NSString stringWithFormat:@"%lld", value];
}

+ (NSString *)stringWithBool:(BOOL)value
{
    if (value == NO)
    {
        return @"0";
    }
    
    return @"1";
}

+ (NSString *)jsonStringWithArray:(NSArray *)array
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:& error];
    if (error != nil)
    {
        return @"";
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
