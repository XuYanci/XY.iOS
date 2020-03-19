//
//  main.m
//  OCRuntime3
///Users/yanci/Desktop/Yanci/YanciXuOwnRearch/XY.iOS/runtime/OCRuntime3/OCRuntime3/main.m
//  Created by Yanci on 2020/3/12.
//  Copyright © 2020 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person:NSObject
@property (nonatomic,copy) NSMutableArray *mArr;
+ (void)name;
@end

@implementation Person

@end

@implementation NSObject(Test)

- (void)name {
    NSLog(@"name");
}

@end

@interface Sark : NSObject
@property (nonatomic, copy) NSString *name;
@end
@implementation Sark
- (void)speak
{
    NSLog(@"my name is %@", self.name);
}
@end
@interface Test : NSObject
@end
@implementation Test
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *str = @"hello world";
        id cls = [Sark class];
        void *obj = &cls;
        [(__bridge id)obj speak];
    }
    return self;
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[Test alloc] init];
        [[Person new]name];
    }
 
    return 0;
}
