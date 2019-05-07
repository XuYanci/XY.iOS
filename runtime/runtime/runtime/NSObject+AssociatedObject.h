//
//  NSObject+AssociatedObject.h
//  runtime
//
//  Created by Yanci on 2019/5/7.
//  Copyright © 2019 tdw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AssociatedObject)
@property (nonatomic, strong) id associatedObject;
@end

NS_ASSUME_NONNULL_END
