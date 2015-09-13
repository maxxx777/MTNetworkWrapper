MTNetworkWrapper
====================

This class wraps any HTTP request networking. You can use any kind of networking lib ([AFNetworking](https://github.com/AFNetworking/AFNetworking) or your custom or favorite network lib) inside the class.

`- (void)sendHttpRequest:(NSURLRequest *)request completion:(MTNetworkWrapperRequestCompletionBlock)completion`

send URL request with given request and handle completion block.

`typedef void (^MTNetworkWrapperRequestCompletionBlock)(id rawData, NSError *error)`

completion block has two params: rawData and error.

Usage
====================
1. Copy files from Classes into your project and include `MTNetworkWrapper.h`. 
2. Go to `Build Phases` and add flag `-fno-objc-arc` for `JSONKit.m` in `Compile Sources`.

DemoApp
====================
See DemoAppTests.m
