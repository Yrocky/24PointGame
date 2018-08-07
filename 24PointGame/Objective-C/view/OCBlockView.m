//
//  OCBlockView.m
//  24PointGame
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import "OCBlockView.h"
#import "OCBlock.h"
#import "Masonry.h"

@implementation OCBlockView

+ (instancetype) blockViewWith:(OCBlock *)block{
    return [[self alloc] initWith:block];
}

- (instancetype) initWith:(OCBlock *)block{
    self = [super init];
    if (self) {
        
        self.alpha = 0;
        _block = block;
        
        _mm_blockOrigin = CGPointMake(_block.x / 4.0, _block.y / 5.0);
        _mm_blockSize = [self fetchBlockSize];
        
        _contentImageView = [UIImageView new];
        _contentImageView.image = [self fetchContentImage];
        [self addSubview:_contentImageView];
        
        self.userInteractionEnabled = YES;
        _gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(onGestureAction:)];
        [self addGestureRecognizer:_gesture];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    [super willMoveToSuperview:newSuperview];
    
    [UIView animateWithDuration:1.25 animations:^{
        self.alpha = 1;
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
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

- (UIImage *) fetchContentImage{
    if (self.block.type == OCBlockTypeEnemy) {
        return [UIImage imageNamed:@"enemy"];
    }
    else if (self.block.type == OCBlockTypeSoldier){
        return [UIImage imageNamed:@"soldier"];
    }
    else if (self.block.type == OCBlockTypeGeneralVertical ||
             self.block.type == OCBlockTypeGeneralHorizontal){
        return [UIImage imageNamed:@"general"];
    }
    return nil;
}

- (CGRect) fetchDestinationRectWith:(CGFloat)moveOffset to:(OCBlockViewMoveDirection)direction{
    
    CGRect originalRect = self.frame;
    CGRect desRect = CGRectZero;
    if (direction == OCBlockViewMoveToUp) {
        desRect = (CGRect){
            originalRect.origin.x,
            originalRect.origin.y - moveOffset,
            originalRect.size
        };
    }
    else if (direction == OCBlockViewMoveToDown) {
        desRect = (CGRect){
            originalRect.origin.x,
            originalRect.origin.y + moveOffset,
            originalRect.size
        };
    }
    else if (direction == OCBlockViewMoveToLeft) {
        desRect = (CGRect){
            originalRect.origin.x - moveOffset,
            originalRect.origin.y,
            originalRect.size
        };
    }
    else if (direction == OCBlockViewMoveToRight) {
        desRect = (CGRect){
            originalRect.origin.x + moveOffset,
            originalRect.origin.y,
            originalRect.size
        };
    }
    return desRect;
}
#pragma mark - Action

- (void) onGestureAction:(UIPanGestureRecognizer *)gesture{

    if (gesture.state == UIGestureRecognizerStateChanged &&
        !_alreadyResponseGesture) {
        [self commitTranslation:[gesture translationInView:self]];
    }
    else if(gesture.state == UIGestureRecognizerStateEnded ||
            gesture.state == UIGestureRecognizerStateCancelled ||
            gesture.state == UIGestureRecognizerStateFailed){
        _alreadyResponseGesture = NO;
    }
}

- (void)commitTranslation:(CGPoint)translation{
    
    CGFloat absX = fabs(translation.x);
    CGFloat absY = fabs(translation.y);
    
    OCBlockViewMoveDirection moveDirection = OCBlockViewMoveToUnknow;
    if (MAX(absX, absY) < 15){
        _alreadyResponseGesture = NO;
        return;
    }
    if (absX > absY ) {
        if (translation.x < 0) {
            moveDirection = OCBlockViewMoveToLeft;
        }else{
            moveDirection = OCBlockViewMoveToRight;
        }
    }
    else if (absY > absX) {
        if (translation.y < 0) {
            moveDirection = OCBlockViewMoveToUp;
        }else{
            moveDirection = OCBlockViewMoveToDown;
        }
    }
    if (moveDirection != OCBlockViewMoveToUnknow &&
        self.delegate &&
        [self.delegate respondsToSelector:@selector(blockView:willMoveTo:)]) {
        [self.delegate blockView:self willMoveTo:moveDirection];
    }
    _alreadyResponseGesture = moveDirection != OCBlockViewMoveToUnknow;
}

@end
