//
//  main.m
//  Block1
//
//  Created by Yanci on 2019/5/7.
//  Copyright © 2019 Yanci. All rights reserved.
//


#import <Foundation/Foundation.h>


void exampleA() {
    char a = 'A';
    ^{
        printf("%c\n", a);
    }();
}

void exampleB_addBlockToArray(NSMutableArray *array) {
    char b = 'B';
    [array addObject:^{
     printf("%c\n", b);
     }];
}
void exampleB() {
    NSMutableArray *array = [NSMutableArray array];
    exampleB_addBlockToArray(array);
    void (^block)() = [array objectAtIndex:0];
    block();
}

void exampleC_addBlockToArray(NSMutableArray *array) {
    [array addObject:^{
     printf("C\n");
     }];
}
void exampleC() {
    NSMutableArray *array = [NSMutableArray array];
    exampleC_addBlockToArray(array);
    void (^block)() = [array objectAtIndex:0];
    block();
}

typedef void (^dBlock)();
dBlock exampleD_getBlock() {
    char d = 'D';
    return ^{
        printf("%c\n", d);
    };
}
void exampleD() {
    exampleD_getBlock()();
}

typedef void (^eBlock)();
eBlock exampleE_getBlock() {
    char e = 'E';
    void (^block)() = ^{
        printf("%c\n", e);
    };
    return block;
}
void exampleE() {
    eBlock block = exampleE_getBlock();
    block();
}


int main()
{
    ^{ printf("Hello, World!\n"); } ();
    // https://blog.devtang.com/2013/07/28/a-look-inside-blocks/
    exampleA();
    exampleB();
    exampleC();
    exampleD();
    exampleE();
    return 0;
}
