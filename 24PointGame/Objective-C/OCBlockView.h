//
//  OCBlockView.h
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCBlock;
@interface OCBlockView : UIButton

@property (nonatomic ,strong ,readonly) OCBlock * block;
@property (nonatomic ,assign ,readonly) CGPoint mm_blockOrigin;
@property (nonatomic ,assign ,readonly) CGSize mm_blockSize;

+ (instancetype) blockViewWith:(OCBlock *)block;
@end
