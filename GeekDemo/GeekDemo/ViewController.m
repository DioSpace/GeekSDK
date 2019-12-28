//
//  ViewController.m
//  GeekDemo
//
//  Created by Geek on 2019/12/28.
//  Copyright © 2019 Geek. All rights reserved.
//

#import "ViewController.h"
#import "NetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)judge:(UIButton *)sender {
    NetViewController *vc = [NetViewController new];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
