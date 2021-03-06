//
//  MTNetworkWrapper.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTNetworkWrapper.h"

@interface MTNetworkWrapper ()

@property (nonatomic, strong) id<MTNetworkWrapperInterface> mockServer;
@property (nonatomic, copy) MTNetworkWrapperRequestCompletionBlock requestCompletionBlock;

@end

@implementation MTNetworkWrapper

- (instancetype)initWithMockServer:(id)mockServer
{
    self = [super init];
    if (self) {
        
        _mockServer = mockServer;
        
    }
    return self;
}

- (void)sendHttpRequest:(NSURLRequest *)request
             completion:(MTNetworkWrapperRequestCompletionBlock)completion
{
    if (self.mockServer) {
        
        [self.mockServer sendHttpRequest:request completion:completion];
        
    } else {
     
        [self setRequestCompletionBlock:completion];
        __weak MTNetworkWrapperRequestCompletionBlock weakCompletionHandler = self.requestCompletionBlock;
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSInteger statusCode = [((NSHTTPURLResponse*)response) statusCode];
                                          NSDictionary *result;
                                          
                                          if (statusCode == 200) {
                                              result = [self convertDataToJSON:data
                                                                     withError:&error];
                                          } else {
                                              
                                              NSDictionary *userInfo = @{
                                                                         @"description" : [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
                                                                         };
                                              
                                              error = [NSError errorWithDomain:MTNetworkWrapperErrorDomain
                                                                          code:statusCode
                                                                      userInfo:userInfo];
                                              
                                          }
                                          
                                          weakCompletionHandler(result, error);
                                      }];
        [task resume];
        
    }
}

- (NSDictionary *)convertDataToJSON:(NSData *)data withError:(NSError **)error {

    NSString *string = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding: NSUTF8StringEncoding];
    //NSString *string = @"{\"status\": \"OK\"}";
    NSData *result = [string dataUsingEncoding:NSUTF8StringEncoding];
//    DLog(@"response: %@", string);
    
    return [NSJSONSerialization JSONObjectWithData:result options:kNilOptions error:error];    
}

@end
