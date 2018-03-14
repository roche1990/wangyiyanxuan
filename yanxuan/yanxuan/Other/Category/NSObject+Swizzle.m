//
//  NSObject+Swizzle.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "NSObject+Swizzle.h"

@implementation NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSel swizzledSelector:(SEL)swizzledSel originClass:(Class )originClass{
    
    Method originMethod = class_getInstanceMethod(originClass, originalSel);
    Method swizzedMehtod = class_getInstanceMethod(originClass, swizzledSel);
    BOOL success = class_addMethod(originClass, originalSel, method_getImplementation(swizzedMehtod), method_getTypeEncoding(swizzedMehtod));
    
    if (success) {
        class_replaceMethod(originClass, swizzledSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, swizzedMehtod);
    }
}

@end
