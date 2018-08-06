//
//  OCLevel.h
//  24PointGame
//
//  Created by user1 on 2018/8/5.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OCBlock;
@class OCBlockView;
@interface OCLevel : NSObject

@property (nonatomic, assign, readonly) NSInteger level;
@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, assign, readonly) NSInteger steps;// 最低步数
@property (nonatomic, copy, readonly) NSArray<OCBlock *> * blocks;// block

+ (instancetype) levelWith:(NSString *)data;

- (NSArray<OCBlockView *>*) blockViews;
@end
