//
//  ObjectiveCViewController.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "ObjectiveCViewController.h"
#import "OCLevel.h"
#import "OCGameView.h"
#import "Masonry.h"

@interface ObjectiveCViewController ()
@property (nonatomic ,strong) OCGameView * gameView;
@end

@implementation ObjectiveCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * levelString = @"1;1;34;0,0,7;1,0,0;3,0,7;0,2,7;3,1,7;0,3,2;1,2,1;3,2,3;1,3,5;2,3,4";
    OCLevel * level = [OCLevel levelWith:levelString];
    
//    UIView * redView = [UIView new];
//    redView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:redView];
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(self.view).multipliedBy(1/4.0);
//        make.height.mas_equalTo(self.view).multipliedBy(1/5.0);
//        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
////        make.top.mas_equalTo(self.view.mas_height).multipliedBy(0);
//    }];
    self.gameView = [OCGameView gameViewWith:level];
    [self.view addSubview:self.gameView];
}

- (void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    CGFloat width = self.view.frame.size.width - 40;
    self.gameView.frame = (CGRect){
        20,100,
        width,width * 5.0 / 4.0
    };
}

@end
