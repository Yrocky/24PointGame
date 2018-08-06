//
//  OCStep.h
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger ,OCStepDirection) {
    OCStepUp = 0,
    OCStepLeft,
    OCStepRight,
    OCStepDown
};

@interface OCStep : NSObject

@property (nonatomic ,assign ,readonly) OCStepDirection direction;
@property (nonatomic ,assign ,readonly) OCStepDirection backDirection;
@property (nonatomic ,assign ,readonly) NSUInteger blockViewTag;
+ (instancetype) step:(OCStepDirection)direction with:(NSUInteger)blockViewTag;
@end
