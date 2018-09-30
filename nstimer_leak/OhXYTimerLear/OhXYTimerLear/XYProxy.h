//
//  XYProxy.h
//  OhXYTimerLear
//
//  Created by Yanci on 2018/9/30.
//  Copyright © 2018年 tdw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYProxy : NSProxy
- (instancetype)initWithTarget:(id)target;
@end
