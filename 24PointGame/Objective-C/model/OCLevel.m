//
//  OCLevel.m
//  24PointGame
//
//  Created by user1 on 2018/8/5.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCLevel.h"
#import "NSArray+Sugar.h"
#import "OCBlock.h"
#import "OCBlockView.h"

@implementation OCLevel

+ (instancetype) levelWith:(id)data{
    return [[self alloc] initWith:data];
}

- (instancetype) initWith:(NSString *)data{
    self = [super init];
    if (self) {
        NSArray * tmp = [data componentsSeparatedByString:@";"];
        if (tmp && tmp.count > 4) {
            _name = tmp[0];
            _level = [tmp[1] integerValue];
            _steps = [tmp[2] integerValue];
            _blocks = [[tmp mm_subArrayFrom:3] mm_map:^id(NSString * obj) {
                return [OCBlock blockWith:obj];
            }];
        }
    }
    return self;
}

- (NSArray<OCBlockView *>*) blockViews{
    return [self.blocks mm_map:^id(OCBlock * obj) {
        return [OCBlockView blockViewWith:obj];
    }];
}

@end
