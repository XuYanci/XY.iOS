//
//  main.m
//  Category
//
//  Created by Yanci on 2019/5/16.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@protocol AAA <NSObject>

/// @protocol里面声明的变量不会自动合成,没有ivar,getter and setter
@property (nonatomic,assign) int val;

@end

@interface A : NSObject<AAA>

@end

@implementation A

/// 需要声明自动合成
/// :( 一直以为这个是强调的意思
@synthesize val;

@end

@interface A(Cat)
@property (nonatomic,strong)id associatedObject;
@end

@implementation A(Cat)
@dynamic associatedObject;

- (void)setAssociatedObject:(id)object {
    objc_setAssociatedObject(self, @selector(associatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    A *a = [[A alloc]init];
    a.associatedObject = [[NSObject alloc]init];
    a.val = 100;
    return 0;
}
