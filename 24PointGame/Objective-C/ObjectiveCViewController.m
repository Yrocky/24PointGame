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
@property (nonatomic ,strong) UIButton * backButton;
@property (nonatomic ,strong) UIButton * resetButton;
@property (nonatomic ,strong) UIButton * nextLevelButton;
@end

@implementation ObjectiveCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * levelString = @"1;1;34;0,0,7;1,0,0;3,0,7;0,2,7;3,1,7;0,3,2;1,2,1;3,2,3;1,3,5;2,3,4";
    levelString = @"1;2;69;0,0,7;1,0,0;3,0,2;0,1,7;0,2,7;1,2,1;3,2,3;0,3,7;1,3,8;1,4,9";
    OCLevel * level = [OCLevel levelWith:levelString];
    
    self.gameView = [OCGameView gameViewWith:level];
    [self.view addSubview:self.gameView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"enemy"] forState:UIControlStateNormal];
    [self.backButton setTitle:@"回退" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(onBackAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.resetButton setBackgroundImage:[UIImage imageNamed:@"soldier"] forState:UIControlStateNormal];
    [self.resetButton setTitle:@"复位" forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(onResetAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetButton];
    
    
    self.nextLevelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextLevelButton setBackgroundImage:[UIImage imageNamed:@"general"] forState:UIControlStateNormal];
    [self.nextLevelButton setTitle:@"下一局" forState:UIControlStateNormal];
    [self.nextLevelButton addTarget:self action:@selector(onNextLevelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextLevelButton];
}

- (void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    [self.gameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.view).mas_offset(-20);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(40);
        } else {
            make.top.mas_equalTo(self.view.mas_top).mas_offset(40);
        }
        make.height.mas_equalTo(self.gameView.mas_width).multipliedBy(5.0/4.0);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 60));
        make.top.mas_equalTo(self.gameView.mas_bottom).mas_offset(30);
        make.left.mas_equalTo(self.gameView);
    }];
    
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.backButton);
        make.top.mas_equalTo(self.backButton);
        make.centerX.mas_equalTo(self.gameView);
    }];
    
    [self.nextLevelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.backButton);
        make.top.mas_equalTo(self.backButton);
        make.right.mas_equalTo(self.gameView);
    }];
}

- (void) onBackAction{
    [self.gameView backStep];
}

- (void) onResetAction{
    [self.gameView reset];
}

- (void) onNextLevelAction{
    NSString * levelString = @"1;1;34;0,0,7;1,0,0;3,0,7;0,2,7;3,1,7;0,3,2;1,2,1;3,2,3;1,3,5;2,3,4";
//    levelString = @"1;2;69;0,0,7;1,0,0;3,0,2;0,1,7;0,2,7;1,2,1;3,2,3;0,3,7;1,3,8;1,4,9";
    OCLevel * level = [OCLevel levelWith:levelString];
    [self.gameView updateWith:level];
}
@end
