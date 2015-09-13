//
//  MTMockServerResponseData.m
//  DemoAppTests
//
//  Created by MAXIM TSVETKOV on 29.04.15.
//  Copyright (c) 2015 MAXIM TSVETKOV. All rights reserved.
//

#import "MTMockServerResponseData.h"

@implementation MTMockServerResponseData

- (id)fetchCityListResponse
{
    NSDictionary *rawCityObjectDict1 = [self rawCityDictWithItemId:@12
                                                          cityName:@"New York"
                                                       countryName:@"USA"];
    
    NSDictionary *rawCityObjectDict2 = [self rawCityDictWithItemId:@25
                                                          cityName:@"Moscow"
                                                       countryName:@"Russia"];
    
    NSDictionary *rawCityObjectDict3 = [self rawCityDictWithItemId:@46
                                                          cityName:@"Tokyo"
                                                       countryName:@"Japan"];
    
    NSArray *cities = @[rawCityObjectDict1, rawCityObjectDict2, rawCityObjectDict3];
    
    return @{
             @"data" : cities
            };
}

#pragma mark - Helper

- (NSDictionary *)rawCityDictWithItemId: (NSNumber *)itemId
                               cityName: (NSString *)cityName
                            countryName: (NSString *)countryName
{
    return @{
             @"id" : itemId,
             @"title" : cityName,
             @"country" : countryName ? countryName : [NSNull null]
             };
}

@end
