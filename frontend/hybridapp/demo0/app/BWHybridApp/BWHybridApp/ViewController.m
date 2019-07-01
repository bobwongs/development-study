//
//  ViewController.m
//  BWHybridApp
//
//  Created by BobWong on 2019/7/1.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

#pragma mark - UIWebView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"shouldStartLoadWithRequest: ");
    NSLog(@"    request: %@", request);
    NSLog(@"    navigationType: %@", @(navigationType));
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    
    JSContext *context =  [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    context[@"sendObjcLoginAction"] = ^(NSString *email, NSString *password) {
        NSLog(@"GET CALLBACK %@ %@", email, password);
    };
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFailLoadWithError");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadApp];
}

- (void)loadApp {
    NSString *urlString = @"http://localhost:3000/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [_webView loadRequest:request];
}

- (IBAction)reloadApp:(id)sender {
    [self loadApp];
}

- (IBAction)back:(id)sender {
    [_webView goBack];
}

- (IBAction)reload:(id)sender {
    [_webView reload];
}

- (IBAction)forward:(id)sender {
    [_webView goForward];
}

- (IBAction)iosToJS:(id)sender {
    NSString *string = @"test0()";
    NSString *result = [_webView stringByEvaluatingJavaScriptFromString:string];
    NSLog(@"result: %@", result);
}

@end
