//
//  OCBlock.h
//  24PointGame
//
//  Created by user1 on 2018/8/5.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger ,OCBlockType) {
    OCBlockTypeSoldier,
    OCBlockTypeGeneralVertical,
    OCBlockTypeGeneralHorizontal,
    OCBlockTypeEnemy,
    OCBlockTypeUnknow,
};

@interface OCBlock : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, assign) OCBlockType type;

+ (instancetype) blockWith:(NSString *)data;
@end
