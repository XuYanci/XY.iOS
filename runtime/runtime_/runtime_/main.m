//
//  main.m
//  runtime_
//
//  Created by Yanci on 2019/12/4.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/// Refer:
// https://juejin.im/post/5ac81c75518825556534c0af
// https://juejin.im/post/5c8230916fb9a049bb7d20d9
/// because NSObject's isa use 8 bytes , byte alignment, so 8 + 4 = 12 => 16
@interface Person : NSObject<NSCopying>
{
    int _parent;    // 4 byte
}
@property (nonatomic, assign) int height;
- (void)personMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {}
+ (void)personClassMethod {}
@end

/// 字节对齐, 64位 8字节对齐
@interface Student : Person<NSCopying>
{
@public
    int _no;
    int _age;
    int _sex;
    int _english;
    int _chinese;
}
@property (nonatomic, assign) int score;
// 实例方法
- (void)studentMethod;
// 类方法
+ (void)studentClassMethod;
@end

@implementation Student


- (id)init {
    if (self = [super init]) {
        _no = 1;
        _age = 2;
        _sex = 3;
        _english = 4;
        _chinese = 5;
    }
    return self;
}
- (void)studentMethod {}
+ (void)studentClassMethod {}


@end

struct Student_IMPL {
    Class isa;  // 8 byte
    int _no;    // 4 byte
    int _age;   // 4 byte
    int _sex;   // 4 byte
    int _english; // 4 byte
    int _chinese; // 4 byte
};

struct xx_cc_objc_class{
    Class isa;
};

@interface Dog : NSObject
{
    int age;         //4个字节
    BOOL sex;        //1个字节
    NSString* name;  //8个字节的指针地址
    short lifeTime;      //2个字节
    NSString* style;    //8个字节的指针地址
}

@end

@implementation Dog


@end

@interface Cat : NSObject
{
    NSString* c1;
    NSString* c4;
}

@property(nonatomic, copy)NSString* c2;
@property(nonatomic, copy)NSString* c3;
@end

@implementation Cat

@end

@interface Person1 : NSObject
{
    int int1;
    bool bool1;
    __strong NSString* strong1;
    __weak NSString* weak1;
    char char1;
    __weak NSString* weak2;
    __strong NSString* strong2;
    __strong NSString* strong3;
    char char2;
    __weak NSString* weak3;
    char char3;
    int  int2;
    __weak NSString* weak4;
    __weak NSString* weak5;
}

@end

@implementation Person1


@end
void getOffset() {
    unsigned int count;
    Ivar* ivars =class_copyIvarList(objc_getClass("Person1"), &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"%s = %td",ivar_getName(ivar),offset);
    }
    free(ivars);
    NSLog(@"Person总字节 = %lu",class_getInstanceSize(objc_getClass("Person1")));
}

void getIvarLayout() {
    const uint8_t *strongLayout =   class_getIvarLayout(objc_getClass("Person1"));
    if (!strongLayout) {
        return;
    }
    uint8_t byte;
    while ((byte = *strongLayout++)) {
        //取出byte的左边一位(代表无效值需要跳过)
        unsigned skips = (byte >> 4);
        //取出byte的右边一位(代表变量数量)
        unsigned scans = (byte & 0x0F);
        printf("strongLayout = #%02x\n",byte);
    }
    
    const uint8_t *weakLayout =   class_getWeakIvarLayout(objc_getClass("Person1"));
    if (!weakLayout) {
        return;
    }
    while ((byte = *weakLayout++)) {
        //取出byte的左边一位 (代表无效值需要跳过)
        unsigned skips = (byte >> 4);
        //取出byte的右边一位 (代表变量数量)
        unsigned scans = (byte & 0x0F);
        printf("weakLayout = #%02x\n",byte);
    }
}


int main(int argc, const char * argv[]) {
    
    /// 大端模式 FD FF 00 00
    /// 小端模式:00 00 FF FD
    //  大端模式，是指数据的高字节保存在内存的低地址中，而数据的低字节保存在内存的高地址
    //  小端模式，是指数据的高字节保存在内存的高地址中，而数据的低字节保存在内存的低地址
    int a = 65533; // FD FF 00 00
    
    /// Instance 对象
    Student *stu = [[Student alloc]init];
    printf("int size = %lu",sizeof(int));
    printf("student size = %lu",sizeof(stu));
    
    struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)stu;
    NSLog(@"_no = %d, _age = %d", stuImpl->_no, stuImpl->_age);
    
    class_getInstanceSize([Student class]);
    NSLog(@"%zd,%zd", class_getInstanceSize([NSObject class]) ,class_getInstanceSize([Student class]));
    
    
    NSLog(@"%zd  %zd",
          class_getInstanceSize([Person class]),
          class_getInstanceSize([Student class])
          );
    
    NSObject *object1 = [[NSObject alloc] init];
    NSObject *object2 = [[NSObject alloc] init];
    
    /// 类对象
    Class objectClass1 = [object1 class];
    Class objectClass2 = [object2 class];
    Class objectClass3 = [NSObject class];
    
    // runtime
    // 每一个类在内存中有且只有一个class对象。可以通过打印内存地址证明
    Class objectClass4 = object_getClass(object1);
    Class objectClass5 = object_getClass(object2);
    NSLog(@"%p %p %p %p %p", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5);
    
    
    //runtime中传入类对象此时得到的就是元类对象
    Class objectMetaClass = object_getClass([NSObject class]);
    // 而调用类对象的class方法时得到还是类对象，无论调用多少次都是类对象
    Class cls = [[NSObject class] class];
    objectClass3 = [NSObject class];
    class_isMetaClass(objectMetaClass); // 判断该对象是否为元类对象
    NSLog(@"%p %p %p", objectMetaClass, objectClass3, cls); // 后面两个地址相同，说明多次调用class得到的还是类对象
    
    
    NSObject *object = [[NSObject alloc] init];
    /// objectClass address = object->isa & ISA_MASK
    Class objectClass = [NSObject class];
    objectMetaClass = object_getClass([NSObject class]);
    
    NSLog(@"%p %p %p", object, objectClass, objectMetaClass);
    
    /// objectMetaClass address = objectClass->isa & ISA_MASK
    struct xx_cc_objc_class *objectClass2_ = (__bridge struct xx_cc_objc_class *)(objectClass);
    
    
    /// Dog
    //    Class class = objc_getClass("Dog");
    //    NSLog(@"内存地址：%p",class);
    //    unsigned int count;
    //    Ivar* ivars = class_copyIvarList(objc_getClass("Dog"), &count);
    //    for (unsigned int i = 0; i < count; i++) {
    //        Ivar ivar = ivars[i];
    //        ptrdiff_t offset = ivar_getOffset(ivar);
    //        NSLog(@"%s = %td",ivar_getName(ivar),offset);
    //    }
    //    free(ivars);
    //    NSLog(@"Dog总字节 = %lu",class_getInstanceSize(objc_getClass("Dog")));
    
    /// Cat
    
    unsigned int count;
    Ivar* ivars =class_copyIvarList(objc_getClass("Cat"), &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"%s = %td",ivar_getName(ivar),offset);
    }
    free(ivars);
    NSLog(@"Cat总字节 = %lu",class_getInstanceSize(objc_getClass("Cat")));
    
    getIvarLayout();
    getOffset();
    return 0;
}
