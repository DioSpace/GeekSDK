//
//  AppDelegate.m
//  GeekDemo
//
//  Created by Geek on 2019/12/28.
//  Copyright © 2019 Geek. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    ViewController *tabBarCtrl = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = tabBarCtrl;
    return YES;
}

@end
