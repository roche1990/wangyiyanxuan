//
//  NSObject+Swizzle.h
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSel swizzledSelector:(SEL)swizzledSel originClass:(Class )originClass;

@end
