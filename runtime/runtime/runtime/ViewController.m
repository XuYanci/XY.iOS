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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// 消息解析
- (IBAction)methodResolution:(id)sender {
    
}

/// 快速向前
- (IBAction)fastForwarding:(id)sender {
    
}

/// 普通向前
- (IBAction)normalForwarding:(id)sender {
    
}

/// 解析方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

/// 解析类方法
+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}


@end
