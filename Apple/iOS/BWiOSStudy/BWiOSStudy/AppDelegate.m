//
//  AppDelegate.m
//  BWiOSStudy
//
//  Created by BobWong on 2017/9/30.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "AppDelegate.h"
#import "BWDemo2ViewController.h"
#import "BWDemo3ViewController.h"
#import "BWDemo2Sub0View.h"
#import <MJExtension.h>
#import "BWPersonModel.h"

@interface AppDelegate ()

@property (strong, nonatomic) BWDemo2ViewController *demo2VC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    UIViewController *vc = [[BWDemo3ViewController alloc] init];
    
    BWPersonModel *model = [BWPersonModel mj_objectWithKeyValues:@{}];
    NSLog(@"model: %@", model);
    NSLog(@"model: %@, %@", model.name, model.country);
    
    BWDemo2ViewController *demo2VC = [BWDemo2ViewController new];
    self.demo2VC = demo2VC;
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    UINavigationController *demo2NvgtVC = [[UINavigationController alloc] initWithRootViewController:demo2VC];
    UINavigationController *demo3NvgtVC = [[UINavigationController alloc] initWithRootViewController:[BWDemo3ViewController new]];
    tabBarVC.viewControllers = @[demo3NvgtVC, demo2NvgtVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    /* ---------- Quic Test ---------- */
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([BWDemo2Sub0View class]) bundle:nil];
    NSArray *array = [nib instantiateWithOwner:nil options:nil];
    NSLog(@"nib: %@", nib);
    NSLog(@"array: %@", array);
    
    /* ---------- Quic Test ---------- */
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    self.demo2VC.log = [NSString stringWithFormat:@"source: %@", url.absoluteString];
    
    return YES;
}


-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options{
    self.demo2VC.log = [NSString stringWithFormat:@"options: %@", url.absoluteString];
    
    NSLog(@"query: %@", url.query);
    NSLog(@"host + path: %@%@", url.host, url.path);
    NSLog(@"scheme: %@", url.scheme);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
