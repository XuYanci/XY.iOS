//
//  ViewController.m
//  OhXYTimerLear
//
//  Created by Yanci on 2018/9/30.
//  Copyright © 2018年 tdw. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
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

- (IBAction)push {
//    ViewController1 *vc1 = [[ViewController1 alloc]init];
//    [self.navigationController pushViewController:vc1 animated:true];
    
    NSMethodSignature *sig = [NSObject instanceMethodSignatureForSelector:@selector(init)];
    NSLog(@"numberOfArguments %d", [sig numberOfArguments]);
    NSLog(@"methodReturnLength %d", [sig methodReturnLength]);
    NSInvocation *ivc = [NSInvocation invocationWithMethodSignature:sig];
    [ivc setTarget:self];
    [ivc setSelector:@selector(start2)];
    [ivc invoke];
}

- (void)start3 {
    NSLog(@"start3");
}

- (void)start2 {
    NSLog(@"start3");
}
@end
