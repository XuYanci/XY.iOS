//
//  ViewController.m
//  GCD1
//
//  Created by Yanci on 2018/6/3.
//  Copyright © 2018年 Yanci. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

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


- (IBAction)push:(id)sender {
    ViewController2 *vc2 = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc2 animated:true];
}

@end
