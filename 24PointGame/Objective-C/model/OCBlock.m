//
//  OCBlock.m
//  24PointGame
//
//  Created by user1 on 2018/8/5.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCBlock.h"

@implementation OCBlock
+ (instancetype) blockWith:(NSString *)data{
    return [[self alloc] initWith:data];
}

// 3,0,2
- (instancetype) initWith:(NSString *)data{
    self = [super init];
    if (self) {
        NSArray * tmp = [data componentsSeparatedByString:@","];
        if (tmp && tmp.count == 3) {
            self.x = [tmp[0] integerValue];
            self.y = [tmp[1] integerValue];
            self.type = [self configType:[tmp[2] integerValue]];
        }
    }
    return self;
}

- (OCBlockType) configType:(NSUInteger)i{
    switch (i) {
        case 0:
            return OCBlockTypeEnemy;
        case 1:
        case 8:
        case 9:
        case 10:
            return OCBlockTypeGeneralHorizontal;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            return OCBlockTypeGeneralVertical;
        case 7:
            return OCBlockTypeSoldier;
        default:
            return OCBlockTypeUnknow;
            break;
    }
}
@end
