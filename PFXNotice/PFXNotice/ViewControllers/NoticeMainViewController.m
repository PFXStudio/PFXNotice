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

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation NoticeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.noticeView roundLayer];
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
    
    self.checkButton.tag = 1;
    [self touchedCheckButton:nil];
    [self.noticeContainerViewController nextViewControllersWithIdentifier:@"" completion:^{
        NSLog(@"count %d", [[NoticeData sharedNoticeDatas] count]);
        if ([[NoticeData sharedNoticeDatas] count] > 0)
        {
            return;
        }
        
        [self.nextButton setTitle:@"close" forState:UIControlStateNormal];
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


@end
