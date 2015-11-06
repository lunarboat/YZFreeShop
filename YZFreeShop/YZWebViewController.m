//
//  YZWebViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/4.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZWebViewController.h"

@interface YZWebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *customWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reloadButtonItem;

@end
@implementation YZWebViewController

- (void)viewDidLoad{
    [self loadPageFromURLString];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = YES;
}

- (void)loadPageFromURLString{
    [_customWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_RequestURLString]]];
}
- (void)loadPageFromHTMLString:(NSString *)HTMLString baseURLString:(NSString *)baseURLString{
    [_customWebView loadHTMLString:HTMLString baseURL:[NSURL URLWithString:baseURLString]];
}

#pragma mark - target-action
- (IBAction)closeItemClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)backItemClick:(id)sender {
    [_customWebView goBack];
}
- (IBAction)forwordItemClick:(id)sender {
    [_customWebView goForward];
}
- (IBAction)reloadItemClick:(id)sender {
    if ([_customWebView isLoading]) {
        [_customWebView stopLoading];
    }else{
        [_customWebView reload];
    }
}

#pragma mark - webViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_reloadButtonItem setTitle:@"停止"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_reloadButtonItem setTitle:@"刷新"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [_reloadButtonItem setTitle:@"刷新"];
}
@end
