//
//  OCBlockView.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCBlockView.h"

@implementation OCBlockView

+ (instancetype) blockViewWith:(OCBlock *)block{
    return [[self alloc] initWith:block];
}

- (instancetype) initWith:(OCBlock *)block{
    self = [super init];
    if (self) {
        _block = block;
    }
    return self;
}

@end
