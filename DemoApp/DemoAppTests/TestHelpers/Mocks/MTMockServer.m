//
//  MTMockServer.m
//  DemoAppTests
//
//  Created by MAXIM TSVETKOV on 29.04.15.
//  Copyright (c) 2015 MAXIM TSVETKOV. All rights reserved.
//

#import "MTMockServer.h"
#import "MTMockServerResponseData.h"

@interface MTMockServer ()

@property (nonatomic, strong) MTMockServerResponseData *stubResponseData;

@end

@implementation MTMockServer

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _stubResponseData = [[MTMockServerResponseData alloc] init];
        
    }
    return self;
}

#pragma mark - MTNetworkWrapperInterface

- (void)sendHttpRequest:(NSURLRequest *)request
             completion:(MTNetworkWrapperRequestCompletionBlock)completion
{
    sleep(1.0);
    
    if ([[request.URL absoluteString] rangeOfString:@"/api/v1/cities"].location != NSNotFound && [request.HTTPMethod isEqualToString:@"GET"]) {
        
        id response = [self.stubResponseData fetchCityListResponse];
        completion(response, nil);
        
    } else {
        
        NSError *error = [NSError errorWithDomain:MTNetworkWrapperErrorDomain
                                             code:0
                                         userInfo:nil];
        completion(nil, error);
    }
}

@end
