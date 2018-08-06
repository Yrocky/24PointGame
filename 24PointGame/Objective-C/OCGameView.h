//
//  OCGameView.h
//  24PointGame
//
//  Created by user1 on 2018/8/6.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OCLevel;
@interface OCGameView : UIView

@property (nonatomic ,strong ,readonly) OCLevel * level;
+ (instancetype) gameViewWith:(OCLevel *)level;
- (void) updateWith:(OCLevel *)level;
@end
