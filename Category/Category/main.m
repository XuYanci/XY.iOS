//
//  main.m
//  Category
//
//  Created by Yanci on 2019/5/16.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface A : NSObject

@end

@implementation A

@end

@interface A(Cat)
@property (nonatomic,assign)id associatedObject;
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
    return 0;
}
