//
//  NSDate+Formatter.h
//  CoconutClub
//
//  Created by PfxStudio on 14. 8. 3..
//  Copyright (c) 2014년 PfxStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

- (NSString *)currentFormat;
- (NSString *)currentMessageFormat;
- (NSString *)yyyyMMddFormat;
- (NSString *)yyyyMMddOfWeekFormat;
- (NSString *)yyyyMMddHyphenFormat;
- (NSString *)engMMddOfWeekFormat;
- (NSString *)korMMddOfWeekFormat;
- (NSString *)hhmmFormat;

@end
