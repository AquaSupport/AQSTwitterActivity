//
//  AQSTwitterActivityTests.m
//  AQSTwitterActivityTests
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "AQSTwitterActivity.h"
#import <Social/Social.h>

@interface AQSTwitterActivity (Test)

- (UIViewController *)activityViewControllerWithComposeViewController:(SLComposeViewController *)composeViewController;

@end

@interface AQSTwitterActivityTests : XCTestCase

@property AQSTwitterActivity *activity;

@end

@implementation AQSTwitterActivityTests

- (void)setUp {
    [super setUp];

    _activity = [[AQSTwitterActivity alloc] init];
}

- (void)tearDown {
    [super tearDown];
    
    _activity = nil;
}

- (void)testItsActivityCategoryIsShare {
    XCTAssertTrue(AQSTwitterActivity.activityCategory == UIActivityCategoryShare);
}

- (void)testItReturnsItsImage {
    XCTAssertNotNil(_activity.activityImage);
}

- (void)testItReturnsItsType {
    XCTAssertTrue([_activity.activityType isEqualToString:@"org.openaquamarine.twitter"]);
}

- (void)testItReturnsItsTitle {
    XCTAssertTrue([_activity.activityTitle isEqualToString:@"Twitter"]);
}

- (void)testItAlwaysAbleToPerformActivity {
    NSArray *activityItems = @[@"hoge", [NSURL URLWithString:@"http://google.com/"]];
    XCTAssertTrue([_activity canPerformWithActivityItems:activityItems]);
}

- (void)testItSetFirstStringAsInitialStringToComposeViewController {
    NSString *aString = @"somestr";
    NSString *bString = @"hoge";
    NSArray *items = @[aString, bString];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] setInitialText:aString];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

- (void)testItAddsURLsToComposeViewController {
    NSURL *aURL = [NSURL URLWithString:@"http://google.com/"];
    NSURL *bURL = [NSURL URLWithString:@"http://yahoo.com/"];
    NSArray *items = @[aURL, bURL];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] addURL:aURL];
    [[controllerMock expect] addURL:bURL];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

- (void)testItAddsImagesToComposeViewController {
    UIImage *aImage = [UIImage imageNamed:@"AQSTwitterActivity"];
    UIImage *bImage = [UIImage imageNamed:@"AQSTwitterActivity"];
    NSArray *items = @[aImage, bImage];
    
    id controllerMock = [OCMockObject niceMockForClass:[SLComposeViewController class]];
    [[controllerMock expect] addImage:aImage];
    [[controllerMock expect] addImage:bImage];
    
    [_activity prepareWithActivityItems:items];
    [_activity activityViewControllerWithComposeViewController:controllerMock];
    
    [controllerMock verify];
}

@end
