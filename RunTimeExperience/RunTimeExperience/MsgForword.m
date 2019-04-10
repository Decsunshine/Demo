//
//  MsgForword.m
//  RunTimeExperience
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 decsunshine. All rights reserved.
//

#import "MsgForword.h"
#import <objc/runtime.h>
#import "DefaultClass.h"

@implementation MsgForword

#pragma mark - 动态方法解析

+ (BOOL)resolveClassMethod:(SEL)sel
{
    if (sel == @selector(printA)) {
        /**
         第一个参数： cls:给哪个类添加方法
         第二个参数： SEL name:添加方法的编号
         第三个参数： IMP imp: 方法的实现，函数入口，函数名可与方法名不同（建议与方法名相同）
         第四个参数： types :方法类型，需要用特定符号，参考API
         */
        Class class = [MsgForword class];

        // 1 动态解析到一个默认类方法
        SEL defalutSEL = @selector(defaultMethod);
        Method defaultMethod = class_getClassMethod(self, defalutSEL);
        IMP defaultIMP = method_getImplementation(defaultMethod);
        class_addMethod(object_getClass(class), sel, defaultIMP, "v@:");
        
        // 2 同上
//        class_addMethod(object_getClass(class), sel, (IMP)classMethod , "v@:");

        return YES;
    }
    
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(printA)) {
        /**
         第一个参数： cls:给哪个类添加方法
         第二个参数： SEL name:添加方法的编号
         第三个参数： IMP imp: 方法的实现，函数入口，函数名可与方法名不同（建议与方法名相同）
         第四个参数： types :方法类型，需要用特定符号，参考API
         */
        Class class = [MsgForword class];
        
        // 1 动态解析到一个默认类方法
        SEL defalutSEL = @selector(defaultMethod);
        Method defaultMethod = class_getInstanceMethod(self, defalutSEL);
        IMP defaultIMP = method_getImplementation(defaultMethod);
        class_addMethod(class, sel, defaultIMP, "v@:");
        
        // 2 同上
        //        class_addMethod(object_getClass(class), sel, (IMP)classMethod , "v@:");
        
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}


+ (void)defaultMethod
{
    NSLog(@"default class method");
}

- (void)defaultMethod
{
    NSLog(@"default instance method");
}

void classMethod(id self ,SEL _cmd,id Num)
{
    // 实现内容
    NSLog(@"%@的%@方法动态实现了,参数为%@",self,NSStringFromSelector(_cmd),Num);
}

#pragma mark -- 转发转发第一步

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    // 返回能够处理消息的对象
    if (aSelector == @selector(printB)) {
        return [[DefaultClass alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 如果想替换类方法的接受者，需要覆写 + (id)forwardingTargetForSelector:(SEL)aSelector 方法，并返回类对象
+ (id)forwardingTargetForSelector:(SEL)aSelector
{
    // 返回能够处理消息的对象
    if (aSelector == @selector(printB)) {
        return [DefaultClass class];
    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark -- 转发转发第二步

// 方法签名：返回值类型、参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(printC)) {
        // return [NSMethodSignature signatureWithObjCTypes: "v@:"];
        // return [NSMethodSignature signatureWithObjCTypes: "v16@0:8"];
        // 也可以通过调用DefaultClass的methodSignatureForSelector方法得到方法签名，这种方式需要DefaultClass对象有aSelector方法
        return [[[DefaultClass alloc] init] methodSignatureForSelector: aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

//NSInvocation 封装了一个方法调用，包括：方法调用者，方法，方法的参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument: NULL atIndex: 0]; 获得参数
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //   anInvocation中封装了methodSignatureForSelector函数中返回的方法。
    //   此时anInvocation.target 还是person对象，我们需要修改target为可以执行方法的方法调用者。
    //   anInvocation.target = [[DefaultClass alloc] init];
    //   [anInvocation invoke];
    [anInvocation invokeWithTarget: [[DefaultClass alloc] init]];
}

// 方法签名：返回值类型、参数类型
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(printC)) {
        // return [NSMethodSignature signatureWithObjCTypes: "v@:"];
        // return [NSMethodSignature signatureWithObjCTypes: "v16@0:8"];
        return [NSMethodSignature signatureWithObjCTypes: "v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//NSInvocation 封装了一个方法调用，包括：方法调用者，方法，方法的参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument: NULL atIndex: 0]; 获得参数
+ (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //   anInvocation中封装了methodSignatureForSelector函数中返回的方法。
    //   此时anInvocation.target 还是person对象，我们需要修改target为可以执行方法的方法调用者。
    //   anInvocation.target = [[DefaultClass alloc] init];
    //   [anInvocation invoke];
    [anInvocation invokeWithTarget: [DefaultClass class]];
}

@end
