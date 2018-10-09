//
//  XYProxy.m
//  OhXYTimerLear
//
//  Created by Yanci on 2018/9/30.
//  Copyright © 2018年 tdw. All rights reserved.
//

#import "XYProxy.h"
#import "ViewController1.h"
@implementation XYProxy {
//    __weak id _target;
    __weak ViewController1 *_vc1;
}


- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[XYProxy alloc] initWithTarget:target];
}

- (instancetype)initWithTarget1:(ViewController1 *)target {
    _vc1 = target;
    return self;
}


- (void)tick {
    if (_vc1 != nil) {
        [_vc1 tick];
    } else {
        NSLog(@"oh my tick!");
    }
}

//- (id)forwardingTargetForSelector:(SEL)selector {
//    return _target;
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation {
//    void *null = NULL;
//    [invocation setReturnValue:&null];
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
//    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//}
//
//- (BOOL)respondsToSelector:(SEL)aSelector {
//    return [_target respondsToSelector:aSelector];
//}
//
//- (BOOL)isEqual:(id)object {
//    return [_target isEqual:object];
//}
//
//- (NSUInteger)hash {
//    return [_target hash];
//}
//
//- (Class)superclass {
//    return [_target superclass];
//}
//
//- (Class)class {
//    return [_target class];
//}
//
//- (BOOL)isKindOfClass:(Class)aClass {
//    return [_target isKindOfClass:aClass];
//}
//
//- (BOOL)isMemberOfClass:(Class)aClass {
//    return [_target isMemberOfClass:aClass];
//}
//
//- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
//    return [_target conformsToProtocol:aProtocol];
//}
//
//- (BOOL)isProxy {
//    return YES;
//}
//
//- (NSString *)description {
//    return [_target description];
//}
//
//- (NSString *)debugDescription {
//    return [_target debugDescription];
//}



@end
