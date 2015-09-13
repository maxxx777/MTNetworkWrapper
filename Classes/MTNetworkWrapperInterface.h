//
//  MTNetworkWrapperInterface.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTNetworkWrapperConstants.h"

@protocol MTNetworkWrapperInterface <NSObject>

- (void)sendHttpRequest:(NSURLRequest *)request
             completion:(MTNetworkWrapperRequestCompletionBlock)completion;

@end
