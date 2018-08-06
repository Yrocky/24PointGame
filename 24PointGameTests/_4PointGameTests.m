//
//  _4PointGameTests.m
//  24PointGameTests
//
//  Created by user1 on 2018/8/4.
//  Copyright © 2018年 Yrocky. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Sugar.h"
#import "OCLevel.h"
#import "OCBlock.h"
#import "OCStep.h"

@interface _4PointGameTests : XCTestCase

@end

@implementation _4PointGameTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSubArrayTo{
   
    NSArray * a = @[@"0",@"1",@"2",@"3"];
    id b = [a mm_subArrayTo:0];
    id c = [a mm_subArrayTo:2];
    id d = [a mm_subArrayTo:5];
    id e = [a mm_subArrayTo:-1];
}

- (void) testSubArrayFrom{
    NSArray * a = @[@"0",@"1",@"2",@"3"];
    id b = [a mm_subArrayFrom:0];
    id c = [a mm_subArrayFrom:2];
    id d = [a mm_subArrayFrom:5];
    id e = [a mm_subArrayFrom:-1];
    
}

- (void) testLevelArray{
    NSArray * a = @[@"1;1;34;0,0,7;1,0,0;3,0,7;0,2,7;3,1,7;0,3,2;1,2,1;3,2,3;1,3,5;2,3,4",
                    @"1;2;69;0,0,7;1,0,0;3,0,2;0,1,7;0,2,7;1,2,1;3,2,3;0,3,7;1,3,8;1,4,9"];
    NSArray * b = [a mm_map:^id(id obj) {
        return [OCLevel levelWith:obj];
    }];
    XCTAssertEqual(b.count, 2);
    XCTAssertEqual([b.firstObject class], [OCLevel class]);
}

- (void) testLevel{
    
    NSString * levelString = @"1;1;34;0,0,7;1,0,0;3,0,7;0,2,7;3,1,7;0,3,2;1,2,1;3,2,3;1,3,5;2,3,4";
    OCLevel * level = [OCLevel levelWith:levelString];
    XCTAssertEqual(level.steps, 34);
    XCTAssertEqual(level.level, 1);
    XCTAssertEqual(level.blocks.count, 10);
    
    XCTAssertEqual(level.blocks.firstObject.x, 0);
    XCTAssertEqual(level.blocks.firstObject.y, 0);
    XCTAssertEqual(level.blocks.firstObject.type, OCBlockTypeSoldier);
}

- (void) testBlock{
    
    NSString * blockString = @"3,0,5";
    OCBlock * block = [OCBlock blockWith:blockString];
    XCTAssertEqual(block.x, 3);
    XCTAssertEqual(block.y, 0);
    XCTAssertEqual(block.type, OCBlockTypeGeneralVertical);
}

- (void) testStep{
    OCStep * step = [OCStep step:OCStepUp with:102];
    XCTAssertEqual(step.backDirection, OCStepDown);
    XCTAssertEqual(step.direction, OCStepUp);
    
    step = [OCStep step:OCStepDown with:102];
    XCTAssertEqual(step.backDirection, OCStepUp);
    
    step = [OCStep step:OCStepLeft with:102];
    XCTAssertEqual(step.backDirection, OCStepRight);
    
    step = [OCStep step:OCStepRight with:102];
    XCTAssertEqual(step.backDirection, OCStepLeft);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
