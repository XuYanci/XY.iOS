//
//  ViewController.m
//  runtime
//
//  Created by Yanci on 2018/6/4.
//  Copyright © 2018年 tdw. All rights reserved.
//

#import "ViewController.h"
/// runtime 头文件
#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    NSArray *object = @[@"hello",@"goodbye"];
    object_setIvar(object, class_copyIvarList(object.class,NULL)[1], @"byebye");
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([object class], &count);
    
    for(int i = 0; i <count;i++) {
        Ivar ivar = ivars[i];
        const char *ivarType = ivar_getTypeEncoding(ivar);
        const char *ivarName = ivar_getName(ivar);
        ptrdiff_t offset = ivar_getOffset(ivar);
        NSLog(@"实例变量名为：%s 字符串类型为：%s", ivarName, ivarType);
    }
    free(ivars);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
///// 消息解析
//- (IBAction)methodResolution:(id)sender {
//
//}
//
///// 快速向前
//- (IBAction)fastForwarding:(id)sender {
//
//}
//
///// 普通向前
//- (IBAction)normalForwarding:(id)sender {
//
//}
//
///// 解析方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    return YES;
//}
//
///// 解析类方法
//+ (BOOL)resolveClassMethod:(SEL)sel {
//    return YES;
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//
}


@end
