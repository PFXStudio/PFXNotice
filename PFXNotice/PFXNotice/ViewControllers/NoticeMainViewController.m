//
//  NoticeMainViewController.m
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NoticeMainViewController.h"

@interface NoticeMainViewController ()

@property (strong, nonatomic) IBOutlet UIView *noticeView;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)touchedNextButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
