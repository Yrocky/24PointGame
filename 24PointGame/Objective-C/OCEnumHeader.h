//
//  OCEnumHeader.h
//  24PointGame
//
//  Created by user1 on 2018/8/7.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#ifndef OCEnumHeader_h
#define OCEnumHeader_h

typedef NS_ENUM(NSUInteger ,OCBlockViewMoveDirection) {
    OCBlockViewMoveToUp = 0,
    OCBlockViewMoveToLeft,
    OCBlockViewMoveToRight,
    OCBlockViewMoveToDown,
    OCBlockViewMoveToUnknow,
};

typedef NS_ENUM(NSUInteger ,OCBlockType) {
    OCBlockTypeSoldier,
    OCBlockTypeGeneralVertical,
    OCBlockTypeGeneralHorizontal,
    OCBlockTypeEnemy,
    OCBlockTypeUnknow,
};


#endif /* OCEnumHeader_h */
