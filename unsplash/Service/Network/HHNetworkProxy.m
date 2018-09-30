//
//  HHNetworkProxy.m
//  unsplash
//
//  Created by HF on 2018/9/29.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "HHNetworkProxy.h"
#import <objc/runtime.h>

@interface HHNetworkProxy ()
@property(strong, nonatomic) NSMutableDictionary *selToHandlerMap;
@end

@implementation HHNetworkProxy

+ (void)load
{
    [[HHNetworkProxy sharedInstance] registerHttpProtocol: @protocol(HHUnsplashProtocol)
                                                  handler: [HHUnspashNetworkManager new]];
}

+ (instancetype)sharedInstance {
    static HHNetworkProxy *httpProxy = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpProxy = [HHNetworkProxy alloc];
        httpProxy.selToHandlerMap = [NSMutableDictionary new];
    });

    return httpProxy;
}

- (void)registerHttpProtocol:(Protocol *)httpProtocol handler:(id)handler
{
    unsigned int numberOfMethods = 0;

        //Get all methods in protocol
    struct objc_method_description *methods = protocol_copyMethodDescriptionList(httpProtocol, YES, YES, &numberOfMethods);

        //Register protocol methods
    for (unsigned int i = 0; i < numberOfMethods; i++)
    {
        struct objc_method_description method = methods[i];
        self.selToHandlerMap[NSStringFromSelector(method.name)] = handler;
    }
}

#pragma mark - Methods route

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSString *methodsName = NSStringFromSelector(sel);
    id handler = self.selToHandlerMap[methodsName];

    if (handler != nil && [handler respondsToSelector:sel])
    {
        return [handler methodSignatureForSelector:sel];
    }
    else
    {
        return [super methodSignatureForSelector:sel];
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSString *methodsName = NSStringFromSelector(invocation.selector);
    id handler = self.selToHandlerMap[methodsName];

    if (handler != nil && [handler respondsToSelector:invocation.selector])
    {
        [invocation invokeWithTarget:handler];
    }
    else
    {
        [super forwardInvocation:invocation];
    }
}

@end
