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

#import "NoticeData.h"

@implementation NoticeData

+ (instancetype)noticeDataWithContents:(NSString *)contents imagePath:(NSString *)imagePath
{
    NoticeData *noticeData = [NoticeData new];
    noticeData.contents = contents;
    noticeData.imagePath = imagePath;
    
    return noticeData;
}

+ (NSMutableArray *)sharedNoticeDatas
{
    static NSMutableArray *s_noticeDatas = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_noticeDatas = [NSMutableArray array];
    });
    
    return s_noticeDatas;
}

- (BOOL)hasImagePath
{
    return [self.imagePath length] > 0;
}

@end
