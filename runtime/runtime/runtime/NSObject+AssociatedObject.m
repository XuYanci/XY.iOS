//
//  NSObject+AssociatedObject.m
//  runtime
//
//  Created by Yanci on 2019/5/7.
//  Copyright © 2019 tdw. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
static char kAssociatedObjectKey;



@implementation NSObject (AssociatedObject)
@dynamic associatedObject;

- (void)setAssociatedObject:(id)object {
    objc_setAssociatedObject(self, @selector(associatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, @selector(associatedObject));
//    return objc_getAssociatedObject(self, &kAssociatedObjectKey);
}
@end
