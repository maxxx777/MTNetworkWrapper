//
//  DemoAppTests.m
//  DemoAppTests
//
//  Created by MAXIM TSVETKOV on 13.09.15.
//  Copyright (c) 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MTNetworkWrapper.h"
#import "MTMockServer.h"

@interface DemoAppTests : XCTestCase
{
@private
    MTNetworkWrapper *networkWrapper;
}
@end

@implementation DemoAppTests

- (void)setUp {
    [super setUp];
    
    MTMockServer *mockServer = [[MTMockServer alloc] init];
    networkWrapper = [[MTNetworkWrapper alloc] initWithMockServer:mockServer];
}

- (void)tearDown {

    networkWrapper = nil;
    
    [super tearDown];
}

- (void)testThatNetworkWrapperSendHttpRequestAndGetResponse {
    
    // arrange
    XCTestExpectation *expectation = [self expectationWithDescription:@"send test request"];
    
    NSURL *url = [NSURL URLWithString:@"test.com/api/v1/cities"];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];

    // act
    [networkWrapper sendHttpRequest:urlRequest
                         completion:^(id rawData, NSError *error){
    
                             //assert
                             XCTAssertNotNil(rawData);
                             XCTAssertNil(error);
                             XCTAssertNotNil(urlRequest);
                             
                             [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2.0
                                 handler:nil];
    
}

@end
