//
//  OCStep.m
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCStep.h"

@implementation OCStep

+ (instancetype) step:(OCStepDirection)direction with:(NSUInteger)blockViewTag{
    return [[self alloc] initWith:direction with:blockViewTag];
}

- (instancetype) initWith:(OCStepDirection)direction with:(NSUInteger)blockViewTag{
    self = [super init];
    if (self) {
        _direction = direction;
        _blockViewTag = blockViewTag;
        _backDirection = 3 - direction;
    }
    return self;
}
@end
