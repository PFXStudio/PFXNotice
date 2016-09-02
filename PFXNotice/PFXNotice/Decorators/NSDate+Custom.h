//
//  UIView+CustomAnimation.h
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSDate (Custom)

- (NSString *)toString;
- (BOOL)isEqualWithoutTimeToDate:(NSDate *)otherDate;
+ (instancetype)dateWithoutTime;

@end
