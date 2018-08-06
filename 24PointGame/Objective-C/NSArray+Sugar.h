//
//  NSArray+Sugar.h
//  Weather_App
//
//  Created by user1 on 2017/8/29.
//  Copyright © 2017年 Yrocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sugar)

- (id) mm_first;

- (id) mm_last;

- (id) mm_sample;

- (NSArray *) mm_map:(id (^)(id obj))handle;
- (NSArray *) mm_mapWithskip:(id (^)(id obj, BOOL *skip))handle;
- (NSArray *) mm_mapWithIndex:(id (^)(id obj,NSUInteger index))handle;
- (NSArray *) mm_mapWithSkipIndex:(id (^)(id obj, BOOL *skip, NSUInteger idnex))handle;

- (void) mm_each:(void(^)(id obj))handle;
- (void) mm_each:(void (^)(id))handle options:(NSEnumerationOptions)options;
- (void) mm_eachWithIndex:(void(^)(id obj,NSInteger index))handle;

- (BOOL (^)(id obj)) mm_have;

- (NSArray *) mm_select:(BOOL (^)(id obj))handle;
- (NSArray *) mm_filter:(BOOL (^)(id obj))handle;
- (NSArray *) mm_select:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber;

///< same as addFromArray:
- (NSArray *) mm_merge:(NSArray *)other;
//- (NSArray *) mm_special:(NSString *(^)(id obj))handle1 merge:(NSArray *)other special:(NSString * (^)(id obj))handle;

#pragma mark - 布尔运算
///< self:[1,2,3,4] oher:[1,4,6,7,8] result:[1,4]
- (NSArray *) mm_intersect:(NSArray *)other;

///< self:[1,2,3,4] oher:[1,4,6,7,8] result:[1,2,3,4,6,7,8]
- (NSArray *) mm_union:(NSArray *)other;

///< self:[1,2,3,4] oher:[1,4,6,7,8] result:[2,3,6,7,8]
- (NSArray *) mm_difference:(NSArray *)other;

///< self:[1,2,3,4] oher:[1,4,6,7,8] result:[2,3]
- (NSArray *) mm_subtract:(NSArray *)other;

///< mm_intersect:函数的变形，可以选取哪些成员参与到布尔运算中
- (NSArray *) mm_intersect:(BOOL(^)(id obj))filter other:(NSArray *)other;

#pragma mark - 排序
///< 排序
- (NSArray *) mm_sort:(NSComparisonResult (^)(id obj1, id obj2))handle;

- (NSString *) mm_join;
- (NSString *) mm_join:(NSString *)separator;
@end

@interface NSNumber (Sugar)

- (void) mm_enumerate:(void(^)(NSInteger index))action;
@end

@interface NSArray (MM_Safe)

- (NSArray *) mm_subArrayTo:(NSUInteger)index;
- (NSArray *) mm_subArrayFrom:(NSUInteger)index;
- (NSArray *) mm_subArrayAt:(NSRange)range;
@end
