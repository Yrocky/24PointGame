//
//  OCBlockView.h
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCEnumHeader.h"

@class OCBlock;
@class OCBlockView;

@protocol OCBlockViewDelegate <NSObject>

- (void) blockView:(OCBlockView *)view willMoveTo:(OCBlockViewMoveDirection)direction;
@end

@interface OCBlockView : UIView{
    UIImageView * _contentImageView;
    UIPanGestureRecognizer * _gesture;
    BOOL _alreadyResponseGesture;
}

@property (nonatomic ,strong ,readonly) OCBlock * block;
@property (nonatomic ,assign ,readonly) CGPoint mm_blockOrigin;
@property (nonatomic ,assign ,readonly) CGSize mm_blockSize;

@property (nonatomic ,weak) id<OCBlockViewDelegate> delegate;
+ (instancetype) blockViewWith:(OCBlock *)block;
@end
