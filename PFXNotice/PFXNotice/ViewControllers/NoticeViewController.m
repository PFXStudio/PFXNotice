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

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //http://www.neolli.com/files/attach/images/663/521/355/1e38ae6055a071f808bf4654ae5340a4.jpg
    //http://global.hanwha.co.kr/data/asp/type64/images/languagepop/popup/languagePOPopen_20160711.jpg
    //https://s-media-cache-ak0.pinimg.com/564x/97/45/87/97458755a59fb27712b2550cd5ac235f.jpg
    //https://s-media-cache-ak0.pinimg.com/564x/20/75/dc/2075dc20830cc5a14b1312582c38f978.jpg
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://s-media-cache-ak0.pinimg.com/564x/20/75/dc/2075dc20830cc5a14b1312582c38f978.jpg"]];
    self.webView.scalesPageToFit = true;
    [self.webView loadRequest:request];
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

@end
