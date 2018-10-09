//
//  FJInfomationDetailController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "UIView+Extension.h"
#import "FJInfomationDetailController.h"

@interface FJInfomationDetailController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;

@end

@implementation FJInfomationDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fetchDetail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
-(void)setUpSubviews{
    [self.view addSubview:self.webView];
}
-(void)initConstraints{
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark
-(void)fetchDetail
{
    NSString *requestUrl = URLForge(@"/app/information/detail");
    NSDictionary *param = @{@"id":self.infoId};
    [self.view at_postLoading];
    [[FJService instance].networkService networkWithUrl:requestUrl method:POST parameter:param successBlock:^(id data) {
        NSString *content = [data objectForKey:@"content"];
        self.navigationItem.title = [data objectForKey:@"title"];
        [self.webView loadHTMLString:content baseURL:nil];
        
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}
#pragma mark
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view at_hideLoading];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.view at_postMessage:error.localizedDescription];
}
#pragma mark
-(UIWebView*)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor clearColor];
    }
    return _webView;
}

@end
