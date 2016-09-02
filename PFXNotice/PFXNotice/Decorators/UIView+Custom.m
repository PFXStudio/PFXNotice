//
//  UIView+CustomAnimation.m
//  syncplicity
//
//  Created by Navjot Singh on 4/13/14.
//  Copyright (c) 2014 Syncplicity. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

+ (void)animateAcceleratedBounceEffectWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    if (([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)) {
        [UIView animateWithDuration:duration delay:delay usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:options animations:animations completion:completion];
    } else {
        [UIView animateWithDuration:duration delay:delay options:options animations:animations completion:completion];
    }
}

- (void)roundLayer
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8)
    {
        return;
    }
    
    [self.layer setCornerRadius:5];
    [self.layer setMasksToBounds:YES];
}

- (UIImage *)capture
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
