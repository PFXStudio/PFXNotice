//
//  NoticeViewController.m
//  PFXNotice
//
//  Created by succorer on 2016. 9. 2..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.noticeData.imagePath]];
    self.webView.scalesPageToFit = true;
    [self.webView loadRequest:request];
    
    [self.indicatorView startAnimating];
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

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIView animateWithDuration:1 animations:^{
        [self.webView setAlpha:1];

//        NSString *result = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetWidth;"];
//        int width = [result intValue];
//        NSLog(@"body width %d", width);
//
//        result = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"];
//        int height = [result intValue];
//        NSLog(@"body height %d", height);
        
        CGFloat contentsHeight = webView.scrollView.contentSize.height;
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:contentsHeight], @"contentsHeight", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:kChangedContents object:nil userInfo:userInfo];
    }];
}

@end
