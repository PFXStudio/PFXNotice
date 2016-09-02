//
//  NSDictionary+Custom.m
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import "NSDictionary+Custom.h"

@implementation NSDictionary (Custom)

- (NSString *)dictToJsonString
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:& error];
    if (error != nil)
    {
        return nil;
    }
    
    NSString *encodingString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                     (__bridge CFStringRef)encodingString,
                                                                                     NULL,
                                                                                     CFSTR("!*'();:@&=+$,/?%#[]\""),
                                                                                     kCFStringEncodingUTF8));
    
    
    return jsonString;
}

@end
