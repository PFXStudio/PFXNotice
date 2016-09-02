//
//  Enums.h
//  SimKoong
//
//  Created by succorer on 2016. 2. 4..
//  Copyright © 2016년 succorer. All rights reserved.
//

#ifndef DefineFunctions_h
#define DefineFunctions_h

#define kMainViewController                            (MainViewController *)[UIApplication sharedApplication].delegate.window.rootViewController

#define kNavigationController (NavigationController *)[(MainViewController *)[UIApplication sharedApplication].delegate.window.rootViewController rootViewController]

#define kMainColor [UIColor colorWithRed:0/255.0 green:100/255.0 blue:170/255.0 alpha:1]

#endif

