//
//  HittestView.m
//  HittestView
//
//  Created by Yanci on 2019/5/9.
//  Copyright © 2019 Yanci. All rights reserved.
//

#import "HittestView.h"

@implementation HittestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *touchView = self;
    if ([self pointInside:point withEvent:event] &&
        (!self.hidden) &&
        self.userInteractionEnabled &&
        (self.alpha >= 0.01f)) {
        
        for (UIView *subView in self.subviews) {
            CGPoint subPoint  =[subView convertPoint:point fromView:self];
            UIView *subTouchView = [subView hitTest:subPoint withEvent:event];
            if (subTouchView) {
                touchView = subTouchView;
                break;
            }
        }
    } else {
        touchView = nil;
    }
    
    return touchView;
}
@end
