//
//  ViewController.m
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "ViewController.h"
#import "NoticeMainViewController.h"
#import "NoticeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedShowButton:(id)sender {
//    NoticeMainViewController *noticeMainViewController = [[StoryboardPerform noticeStoryboard] instantiateViewControllerWithIdentifier:NSStringFromClass([NoticeMainViewController class])];
//    
//    self.definesPresentationContext = YES; //self is presenting view controller
//    noticeMainViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//    noticeMainViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    
//    [self presentViewController:noticeMainViewController animated:YES completion:nil];
    
    NoticeViewController *noticeViewController = [[StoryboardPerform noticeStoryboard] instantiateViewControllerWithIdentifier:NSStringFromClass([NoticeViewController class])];
    
    self.definesPresentationContext = YES; //self is presenting view controller
    noticeViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    noticeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:noticeViewController animated:YES completion:nil];

}


@end
