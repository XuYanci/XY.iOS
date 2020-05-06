//
//  ViewController2.m
//  GCD1
//
//  Created by Yanci on 2018/6/3.
//  Copyright © 2018年 Yanci. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (nonatomic,strong)NSString *str;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _str = @"hello world";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self)strongSelf = weakSelf;
        NSLog(@"%@",strongSelf.str);
    });
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
