//
//  OCGameView.m
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCGameView.h"

@implementation OCGameView

+ (instancetype) gameViewWith:(OCLevel *)level{
    return [[self alloc] initWith:level];
}

- (instancetype) initWith:(OCLevel *)level{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.67 green:0.70 blue:0.79 alpha:1.00];
        _level = level;
        [self updateGameBlockView];
    }
    return self;
}

- (void) updateWith:(OCLevel *)level{
    
    _level = level;
    [self updateGameBlockView];
}

- (void) updateGameBlockView{
    
}
@end
