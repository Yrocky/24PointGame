//
//  OCGameView.m
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCGameView.h"
#import "OCLevel.h"
#import "OCBlock.h"
#import "OCBlockView.h"
#import "Masonry.h"
#import "NSArray+Sugar.h"
#import "OCStep.h"

@interface OCGameView ()<OCBlockViewDelegate>
@property (nonatomic ,strong) NSMutableArray <OCStep *>* moveSteps;
@property (nonatomic ,strong) NSArray <OCBlockView *> *blockViews;
@end

@implementation OCGameView

+ (instancetype) gameViewWith:(OCLevel *)level{
    return [[self alloc] initWith:level];
}

- (instancetype) initWith:(OCLevel *)level{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.67 green:0.70 blue:0.79 alpha:1.00];
        
        _level = level;
        _moveSteps = [NSMutableArray array];
        [self updateGameBlockView];
    }
    return self;
}

- (void) updateWith:(OCLevel *)level{
    
    _level = level;
    [self updateGameBlockView];
}

- (void) updateGameBlockView{
    
    [self.blockViews mm_each:^(UIView * sub) {
        nil != sub ? [sub removeFromSuperview] : nil;
    }];
    
    self.blockViews = nil;
    
    self.blockViews = [self.level.blockViews mm_mapWithIndex:^OCBlockView *(OCBlockView * blockView ,NSUInteger index) {
        blockView.tag = index + 100;
        blockView.delegate = self;
        [self addSubview:blockView];
        return blockView;
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.blockViews mm_each:^(OCBlockView * blockView) {
        [blockView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self).multipliedBy(blockView.mm_blockSize.width).offset(-4);
            make.height.mas_equalTo(self).multipliedBy(blockView.mm_blockSize.height).offset(-4);
            make.left.mas_equalTo(self).mas_offset(self.frame.size.width * blockView.mm_blockOrigin.x + 2);
            make.top.mas_equalTo(self).mas_offset(self.frame.size.height * blockView.mm_blockOrigin.y + 2);
        }];
    }];
}

- (BOOL) checkBlockView:(OCBlockView *)blockView canMoveTo:(OCBlockViewMoveDirection)direction{
    
    //
    return NO;
}

- (void) moveBlockView:(OCBlockView *)blockView to:(OCBlockViewMoveDirection)direction{
    
    //
}

- (void) recordBlockView:(OCBlockView *)blockView moveStepTo:(OCBlockViewMoveDirection)direction{

    [self.moveSteps addObject:({
        [OCStep step:direction with:blockView.tag];
    })];
}

- (void) backBlockView{
    
    if (self.moveSteps.count) {
        OCStep * step = [self.moveSteps lastObject];
        OCBlockView * backBlockView = [self viewWithTag:step.blockViewTag];
        [self moveBlockView:backBlockView to:step.backDirection];
        [self.moveSteps removeLastObject];
    }
}

#pragma mark - OCBlockViewDelegate

- (void)blockView:(OCBlockView *)view willMoveTo:(OCBlockViewMoveDirection)direction{
    if ([self checkBlockView:view canMoveTo:direction]){// 如果可以移动
        [self moveBlockView:view to:direction];
        [self recordBlockView:view moveStepTo:direction];
    }
}
@end
