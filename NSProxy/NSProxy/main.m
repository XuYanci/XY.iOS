//
//  main.m
//  NSProxy
//
//  Created by Yanci on 2019/12/26.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TargetProxy : NSProxy {
    id realObject1;
    id realObject2;
}

- (id)initWithTarget:(id)target1 target2:(id)target2;
@end

@implementation TargetProxy

- (id)initWithTarget:(id)target1 target2:(id)target2 {
    realObject1 = target1;
    realObject2 = target2;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    id target = [realObject1 methodSignatureForSelector:invocation.selector] ? realObject1 : realObject2;
    [invocation invokeWithTarget:target];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *signature;
    signature = [realObject1 methodSignatureForSelector:sel];
    if (signature) {
        return signature;
    }
    signature = [realObject2 methodSignatureForSelector:sel];
    return signature;
}
-(BOOL)respondsToSelector:(SEL)aSelector
{
    if ([realObject1 respondsToSelector:aSelector]) {
        return YES;
    }
    if ([realObject2 respondsToSelector:aSelector]) {
        return YES;
    }
    return NO;
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableString *string = [NSMutableString string];
    
    id proxy = [[TargetProxy alloc]initWithTarget:array target2:string];
    [proxy appendString:@"This "];
    
    [proxy appendString:@"is "];
    [proxy addObject:string];
    [proxy appendString:@"a "];
    [proxy appendString:@"test!"];
    NSLog(@"count should be 1,it is:%ld",[proxy count]);
    if ([[proxy objectAtIndex:0] isEqualToString:@"This is a test!"]) {
        NSLog(@"Appending successful: %@",proxy);
    }else
    {
        NSLog(@"Appending failed, got: %@", proxy);
    }
    NSLog(@"Example finished without errors.");
   
    return 0;
}
