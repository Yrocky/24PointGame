//
//  ViewController.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "ViewController.h"
#import "ObjectiveCViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)onOCGameAction:(id)sender {
    ObjectiveCViewController * ocGame = [[ObjectiveCViewController alloc] init];
    [self.navigationController pushViewController:ocGame
                                         animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
