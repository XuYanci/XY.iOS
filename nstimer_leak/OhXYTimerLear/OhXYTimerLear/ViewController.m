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
    ViewController1 *vc1 = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc1 animated:true];
}

@end
