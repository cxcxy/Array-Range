//
//  NSObject+Method.m
//  Array-Range
//
//  Created by 陈旭 on 2017/8/16.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "NSObject+Method.h"
#import <objc/runtime.h>
@implementation NSObject (Method)

-(void)swizzleMethod:(SEL)originalSel swizzledSelector:(SEL)swizzledSel {

    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSel);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSel,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}
@end
