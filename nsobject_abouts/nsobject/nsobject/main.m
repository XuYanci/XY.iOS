//
//  main.m
//  nsobject
//
//  Created by Yanci on 2019/5/8.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    return 0;
}

// Example 1
/**
struct Student_IMPL {
    Class isa;
    int _no;
    int _age;
};

@interface Student : NSObject
{
@public
    int _no;
    int _age;
}
@end

@implementation Student

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 强制转化
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)stu;
        NSLog(@"_no = %d, _age = %d", stuImpl->_no, stuImpl->_age); // 打印出 _no = 4, _age = 5
    }
    return 0;
}
**/


// Example 2
/*
@interface Person : NSObject
{
    int _age;
}
@end

@implementation Person
@end

//Student
@interface Student : Person
{
    int _no;
}
@end

@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%zd  %zd",
              class_getInstanceSize([Person class]),
              class_getInstanceSize([Student class])
              );
    }
    return 0;
}
*/



// Example 3
/*
//Person
@interface Person : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int height;
- (void)personMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {}
+ (void)personClassMethod {}
@end

// Student
@interface Student : Person <NSCoding>
{
@public
    int _no;
}
@property (nonatomic, assign) int score;
- (void)studentMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)studentMethod {}
+ (void)studentClassMethod {}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        Student *stu = [[Student alloc] init];
        [Student load];
        
        Person *p1 = [[Person alloc] init];
        p1->_age = 10;
        [p1 personMethod];
        [Person personClassMethod];
        Person *p2 = [[Person alloc] init];
        p2->_age = 20;
    }
    return 0;
}
*/
