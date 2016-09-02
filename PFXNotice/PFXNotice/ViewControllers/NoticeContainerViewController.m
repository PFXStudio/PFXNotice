//
//  NoticeContainerViewController.m
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NoticeContainerViewController.h"
#import "NoticeViewController.h"

@interface NoticeContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) NoticeViewController *currentNoticeViewController;

@property (strong, nonatomic) void(^completionBlock)(void);

@end

@implementation NoticeContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialize
{
    if (self.currentNoticeViewController == nil)
    {
        return;
    }
    
    [self.currentNoticeViewController removeFromParentViewController];
}

- (void)nextViewControllersWithIdentifier:(NSString *)identifier completion:(void(^)(void))completion
{
    self.completionBlock = completion;
    self.currentSegueIdentifier = identifier;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [self addChildViewController:segue.destinationViewController];
    ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
    [segue.destinationViewController didMoveToParentViewController:self];
}

@end
