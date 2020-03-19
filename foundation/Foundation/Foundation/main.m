//
//  main.m
//  Foundation
//
//  Created by Yanci on 2020/3/19.
//  Copyright © 2020 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface A : NSObject

@property (nonatomic,strong)NSMutableString *testString;

@end

@implementation A



@end

@interface B : NSObject

@property (nonatomic,strong)NSMutableString *testString;

@end

@implementation B



@end

int main(int argc, const char * argv[]) {
  
//    A *a = [[A alloc]init];
//    NSMutableString *string = [NSMutableString stringWithFormat:@"name"];
//    NSLog(@"原始string的地址:%p",string);
//    a.testString = string;
//    NSLog(@"A对象string的地址:%p",a.testString);
//    B *b = [[B alloc]init];
//    b.testString = a.testString ;
//    NSLog(@"B对象string的地址:%p",b.testString);
    
//    NSMutableString *string = [NSMutableString stringWithFormat:@"name"];
//    NSLog(@"原始string的地址:%p",string);
//
//    NSMutableString *copyString = [string copy];
//    NSLog(@"拷贝string的地址:%p",copyString);
//
//    [copyString appendString:@"test"];
    
    
//    NSString *string = [NSString stringWithFormat:@"name"];
//    NSLog(@"原始string的地址:%p",string);
//
//    NSString *copyString = [string copy];
//    NSLog(@"拷贝string的地址:%p",copyString);
    
 
   /// mutableCopy内部包含元素还是浅拷贝,只是做了外部的深拷贝
   NSArray *array = @[[NSMutableString stringWithFormat:@"%@",@"AAA"],@2,@3,@4,@5];
   NSLog(@"原始array的地址:%p",array);
   NSLog(@"原始array0的地址:%p",array[0]);
   NSArray *copyArray = [array mutableCopy];
   NSLog(@"拷贝copyArray的地址:%p",copyArray);
   NSLog(@"拷贝copyArray0的地址:%p",copyArray[0]);
    return 0;
}
