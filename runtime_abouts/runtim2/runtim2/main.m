//
//  main.m
//  runtim2
//
//  Created by Yanci on 2019/5/16.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       
        NSArray *array = @[@"Hello",@"World"];

        /* 通过IVAR进行修改 (OK) */
//        object_setIvar(array, class_copyIvarList(array.class,NULL)[1], @"GoodBye");
//        NSLog(@"%@",array);

        /* 2.通过字符串修改 (TODO) */
        struct string_IMPL {
            char *reserved0;
            char *reserved1;
            char *val1;
        };
        struct string_IMPL *stuImpl = (__bridge struct string_IMPL *)array[0];
        char **ptr1 = &stuImpl->val1;
        *ptr1 = "GoodBye";
        NSLog(@"%@",array);
        
        
       
    }
    return 0;
}
