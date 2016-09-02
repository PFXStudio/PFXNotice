/**
 * Copyright (C) Hanwha S&C Ltd., 2015. All rights reserved.
 *
 * This software is covered by the license agreement between
 * the end user and Hanwha S&C Ltd., and may be
 * used and copied only in accordance with the terms of the
 * said agreement.
 *
 * Hanwha S&C Ltd., assumes no responsibility or
 * liability for any errors or inaccuracies in this software,
 * or any consequential, incidental or indirect damage arising
 * out of the use of the software.
 */

#import "StoryboardPerform.h"

@implementation StoryboardPerform

+ (UIStoryboard *)noticeStoryboard
{
    NSString * storyboardName = @"Notice";
    return [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
}

@end
