//
//  BWDemo3ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/4/28.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo3ViewController.h"
#import "BWDemo4ViewController.h"

@interface BWDemo3ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation BWDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)presentVC:(id)sender {
    BWDemo4ViewController *demo4ViewController = [BWDemo4ViewController new];
    UINavigationController *demo4NvgtVC = [[UINavigationController alloc] initWithRootViewController:demo4ViewController];
    [self presentViewController:demo4NvgtVC animated:YES completion:nil];
}

#pragma mark - UIWebView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"shouldStartLoadWithRequest");
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFailLoadWithError");
}

@end
