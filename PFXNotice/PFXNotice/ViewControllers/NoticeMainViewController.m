//
//  NoticeMainViewController.m
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NoticeMainViewController.h"
#import "NoticeContainerViewController.h"

@interface NoticeMainViewController ()

@property (strong, nonatomic) IBOutlet UIView *noticeView;
@property (weak, nonatomic) NoticeContainerViewController *noticeContainerViewController;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *noticeConainerHeightConstraint;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation NoticeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.noticeView roundLayer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changedContents:) name:kChangedContents object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *destinationViewController = [segue destinationViewController];
    if ([destinationViewController isKindOfClass:[NoticeContainerViewController class]] == NO)
    {
        return;
    }
    
    self.noticeContainerViewController = (NoticeContainerViewController *)destinationViewController;
}

- (IBAction)touchedNextButton:(id)sender {
    if ([[NoticeData sharedNoticeDatas] count] <= 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    NoticeData *noticeData = [[NoticeData sharedNoticeDatas] firstObject];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.noticeConainerHeightConstraint.constant = kDefaultContentsHeight + kToolbarHeight;
    });
    
    self.checkButton.tag = 1;
    [self touchedCheckButton:nil];
    [self.noticeContainerViewController nextViewControllersWithIdentifier:@"" completion:^{
        NSLog(@"count %d", [[NoticeData sharedNoticeDatas] count]);
        if ([[NoticeData sharedNoticeDatas] count] > 0)
        {
            return;
        }
        
        [self.nextButton setImage:[UIImage imageNamed:@"iconClose"] forState:UIControlStateNormal];
    }];
}

- (IBAction)touchedCheckButton:(id)sender {
    self.checkButton.tag++;
    if (self.checkButton.tag % 2 == 0)
    {
        self.checkButton.tag = 0;
        [self.checkButton setImage:[UIImage imageNamed:@"iconNoneCheckBox"] forState:UIControlStateNormal];
        
        return;
    }

    self.checkButton.tag = 1;
    [self.checkButton setImage:[UIImage imageNamed:@"iconCheckBox"] forState:UIControlStateNormal];
}

- (void)changedContents:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSNumber *contentsHeight = [userInfo objectForKey:@"contentsHeight"];
    if (kDefaultContentsHeight >= [contentsHeight floatValue])
    {
        return;
    }
    
    CGFloat maxHeight = self.view.frame.size.height - 100;
    CGFloat fixHeight = MIN([contentsHeight floatValue], maxHeight);
    
    NSLog(@"%s userInfo %f", __func__, fixHeight);
    self.noticeConainerHeightConstraint.constant = fixHeight + kToolbarHeight;
}


@end
