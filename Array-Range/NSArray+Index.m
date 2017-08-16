//
//  NSArray+Index.m
//  Array-Range
//
//  Created by 陈旭 on 2017/8/16.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "NSArray+Index.h"
#import "NSObject+Method.h"
#import <objc/runtime.h>
@implementation NSArray (Index)


/* 不推荐类似的方法，因为这会hook住系统的objectAtIndex 方法， 而系统本身在一些其他的操作方面， 也会调用这个方法，所以会一定程度上的消耗性能，也会出现一些奇怪的闪退 ， 目前的做法是写一个类目，延展一个方法， 然后，我们在需要用的地方， 去用就好*/
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            /*--- 类簇 ---
                NSArray                 = __NSArrayI
                NSMutableArray          = __NSArrayM
                NSDictionary            = __NSDictionaryI
                NSMutableDictionary     = __NSDictionaryM
             */
    
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(wow_ObjectIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(wow_MutObjectIndex:)];

        }
    });


}
// 虽然实现内容差不多，但是不能公用一套方法体
- (id)wow_MutObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self wow_MutObjectIndex:index];
}
- (id)wow_ObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self wow_ObjectIndex:index];
}
@end




@implementation NSMutableArray (At_Index)

-(id)get_Index:(NSInteger)index {
    
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
