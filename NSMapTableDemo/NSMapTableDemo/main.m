//
//  main.m
//  NSMapTableDemo
//
//  Created by Yanci Xu on 2021/11/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
        NSString *key = @"key";
//        [mDict setValue:@"Value" forKey:key];
        key = @"Hello";
        
        NSNumber *a = @(1);
        [mDict setObject:@"Value" forKey:a];
        a = @(2);
        
        
//        NSMapTable *objectToObjectMapping =
//            [NSMapTable mapTableWithStrongToStrongObjects];
        
        
    }
    return 0;
}
