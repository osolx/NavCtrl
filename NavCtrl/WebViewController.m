//
//  WebViewController.m
//  NavCtrl
//
//  Created by Omar Soliman on 6/1/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:[[WKWebViewConfiguration alloc]init]];
    webView.bounds = self.view.bounds;
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.url];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
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
