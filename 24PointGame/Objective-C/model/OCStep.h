//
//  OCStep.h
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCEnumHeader.h"

@interface OCStep : NSObject

@property (nonatomic ,assign ,readonly) OCBlockViewMoveDirection direction;
@property (nonatomic ,assign ,readonly) OCBlockViewMoveDirection backDirection;
@property (nonatomic ,assign ,readonly) NSUInteger blockViewTag;
+ (instancetype) step:(OCBlockViewMoveDirection)direction with:(NSUInteger)blockViewTag;
@end
