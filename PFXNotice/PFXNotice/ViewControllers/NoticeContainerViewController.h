//
//  NoticeContainerViewController.h
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeContainerViewController : UIViewController

- (void)nextViewControllersWithIdentifier:(NSString *)identifier completion:(void(^)(void))completion;

@end
