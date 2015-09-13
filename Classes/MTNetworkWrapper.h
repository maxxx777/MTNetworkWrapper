//
//  MTNetworkWrapper.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTNetworkWrapperInterface.h"

@interface MTNetworkWrapper : NSObject
<
    MTNetworkWrapperInterface
>

- (instancetype)initWithMockServer:(id)mockServer;

@end
