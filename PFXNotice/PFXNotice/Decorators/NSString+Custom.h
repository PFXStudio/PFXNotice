//
//  UIView+CustomAnimation.h
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Custom)

- (BOOL)isValidEmail;
- (BOOL)isValidOnlyChracters;
- (BOOL)isValidInteger;
- (NSInteger)converToInteger;
- (NSArray *)jsonStringToArray;
- (NSDictionary *)jsonStringToDictionary;

+ (NSString *)stringWithInteger:(NSInteger)value;
+ (NSString *)stringWithFloat:(CGFloat)value;
+ (NSString *)stringWithLongLong:(long long)value;
+ (NSString *)stringWithBool:(BOOL)value;
+ (NSString *)jsonStringWithArray:(NSArray *)array;

@end
