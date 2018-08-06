//
//  OCBlockView.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCBlockView.h"
#import "OCBlock.h"

@implementation OCBlockView

+ (instancetype) blockViewWith:(OCBlock *)block{
    return [[self alloc] initWith:block];
}

- (instancetype) initWith:(OCBlock *)block{
    self = [super init];
    if (self) {
        _block = block;
        _mm_blockOrigin = CGPointMake(_block.x / 4.0, _block.y / 5.0);
        _mm_blockSize = [self fetchBlockSize];
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (CGSize) fetchBlockSize{
    
    if (self.block.type == OCBlockTypeEnemy) {
        return (CGSize){2.0/4.0,2.0/5.0};
    }
    else if (self.block.type == OCBlockTypeSoldier){
        return (CGSize){1.0/4.0,1.0/5.0};
    }
    else if (self.block.type == OCBlockTypeGeneralVertical){
        return (CGSize){1.0/4.0,2.0/5.0};
    }
    else if (self.block.type == OCBlockTypeGeneralHorizontal){
        return (CGSize){2.0/4.0,1.0/5.0};
    }
    return CGSizeZero;
}
@end
