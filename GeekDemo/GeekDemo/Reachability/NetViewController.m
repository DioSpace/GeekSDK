//
//  NetViewController.m
//  GeekDemo
//
//  Created by Geek on 2019/12/28.
//  Copyright © 2019 Geek. All rights reserved.
//

#import "NetViewController.h"
#import "Reachability.h"

@interface NetViewController ()

@property (nonatomic, strong) Reachability *reachability;

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"Judge" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(30, 100, 300, 44);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(netAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)netAction {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    //初始化监听控件
    self.reachability = [Reachability reachabilityForInternetConnection];
    // 开始监听
    [self.reachability startNotifier];
    NetworkStatus netStatus = [self.reachability currentReachabilityStatus];
    NSLog(@"刚打开网络监听时,网络状态未变化,打印一下网络状态:");
    switch (netStatus) {
        case NotReachable:
            NSLog(@"first----------网络有问题");
            break;
        case ReachableViaWWAN:
            NSLog(@"first----------蜂窝网络");
            break;
        case ReachableViaWiFi:
            NSLog(@"first----------连接wifi");
            break;
        default:
            break;
    }
}

/*
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    
    // 自己获取网络
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
        case NotReachable:
            NSLog(@"changed----------网络有问题");
            break;
        case ReachableViaWWAN:
            NSLog(@"changed----------蜂窝网络");
            break;
        case ReachableViaWiFi:
            NSLog(@"changed----------连接wifi");
            break;
        default:
            NSLog(@"不明原因");
            break;
    }
}
//controller销毁时移出通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}


@end
