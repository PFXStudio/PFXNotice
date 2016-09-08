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
    NSMutableArray *noticeDatas = [NoticeData sharedNoticeDatas];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"" imagePath:@"http://www.neolli.com/files/attach/images/663/521/355/1e38ae6055a071f808bf4654ae5340a4.jpg"]];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n민ㅇ햐ㅐㅁ곰댁허ㅐㅁㄴㅇㅍㅁ래눙ㄹ ㅇㄴ머ㅐㄹㅁㄴ어 \n asdflajvoi soadjvaosdjosadfjoias ㄴㅇ래모ㅑㅇ러마ㅣㄴㅇㅁ 이ㅓ \n" imagePath:nil]];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"" imagePath:@"http://global.hanwha.co.kr/data/asp/type64/images/languagepop/popup/languagePOPopen_20160711.jpg"]];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"" imagePath:@"https://s-media-cache-ak0.pinimg.com/564x/97/45/87/97458755a59fb27712b2550cd5ac235f.jpg"]];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"asdojasodiasdfljalsd" imagePath:nil]];
    [noticeDatas addObject:[NoticeData noticeDataWithContents:@"" imagePath:@"https://s-media-cache-ak0.pinimg.com/564x/20/75/dc/2075dc20830cc5a14b1312582c38f978.jpg"]];

    NoticeMainViewController *noticeMainViewController = [[StoryboardPerform noticeStoryboard] instantiateViewControllerWithIdentifier:NSStringFromClass([NoticeMainViewController class])];
    
    self.definesPresentationContext = YES; //self is presenting view controller
    noticeMainViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    noticeMainViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:noticeMainViewController animated:YES completion:nil];
    
//    NoticeViewController *noticeViewController = [[StoryboardPerform noticeStoryboard] instantiateViewControllerWithIdentifier:NSStringFromClass([NoticeViewController class])];
//    
//    self.definesPresentationContext = YES; //self is presenting view controller
//    noticeViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//    noticeViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    
//    [self presentViewController:noticeViewController animated:YES completion:nil];

}


@end
