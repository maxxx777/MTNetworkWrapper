//
//  MTNetworkWrapperConstants.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import <Foundation/Foundation.h>

typedef void (^MTNetworkWrapperRequestCompletionBlock)(id rawData, NSError *error);

static NSString * const MTNetworkWrapperErrorDomain = @"MTNetworkWrapper.ErrorDomain";
