//
//  NSObject+Method.h
//  Array-Range
//
//  Created by 陈旭 on 2017/8/16.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Method)
- (void)swizzleMethod:(SEL)originalSel swizzledSelector:(SEL)swizzledSel;
@end
