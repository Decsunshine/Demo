/*
 SEL method_getName(Method method);
 IMP method_getImplementation(Method method);
 const char * ivar_getTypeEncoding(Ivar ivar);
 */

#import "ViewController.h"
#import "objc/runtime.h"
#import <objc/message.h>

#import "SomeObject.h"

#import "ReplaceMethod.h"
#import "ExchangeMethod.h"
#import "MsgForword.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 替换实例方法
//    [[ReplaceMethod new] printA];
    
    // 交换实例方法
//    [[ExchangeMethod new] printA];
//    [[ExchangeMethod new] printB];
    
//    [ExchangeMethod printA];
    
//    [MsgForword printA];
//    [[MsgForword new] printA];
    
//    [MsgForword printB];
//    [[MsgForword new] printB];
    
//    [MsgForword printC];
//    [[MsgForword new] printC];

    // 改变类的私有属性
    [self changePrivateProperty];
    
    // 调用私有方法
//    [self dispatchPrivateMethod];
}

// 调用私有方法
- (void)dispatchPrivateMethod
{
    SomeObject *object = [SomeObject new];
    
    // 1. 使用 performSelector，但参数不能很好的传递，这个方案不行
    [object performSelector:@selector(privateMethod:) withObject:@(0)];
    
    // 2. 使用 objc_msgSend，但参数不能很好的传递，这个方案不行
    ((void(*)(id, SEL, NSNumber *))objc_msgSend)(object, @selector(privateMethod:), @(1));
    
    // 3. NSInvocation
    NSMethodSignature *methodSignature = [object methodSignatureForSelector:@selector(privateMethod:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    BOOL boolArgument = false;
    [invocation setArgument:&boolArgument atIndex:2];
    invocation.selector = @selector(privateMethod:);
    invocation.target = object;
    [invocation invoke];
}

// 改变类的私有属性
- (void)changePrivateProperty
{
    SomeObject *object = [SomeObject new];
    
    // 1 使用 perforSelector
    [object performSelector:@selector(setName:) withObject:@"anotherName"];
    NSLog(@"%@", [object performSelector:@selector(name)]);
    
    // 2 遍历 ivarList
    unsigned int count = 0;
    Ivar *members = class_copyIvarList([SomeObject class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = members[i];
        const char *memberName = ivar_getName(ivar);
        const char *memberType = ivar_getTypeEncoding(ivar);
        //依次打印属性名称和属性类型
        NSLog(@"%d %s : %s", i, memberName, memberType);
        
        if (strcmp(memberName, "_name") == 0) {
            // 修改前
            NSString *name = (NSString *)object_getIvar(object, members[i]);
            NSLog(@"before -name:%@", name);
            
            // 修改后
            object_setIvar(object, members[i], @"Jabit");
            NSString *nameReset = (NSString *)object_getIvar(object, members[i]);
            NSLog(@"after -name:%@", nameReset);
            
            break;
        }
    }
    
    // 3 操作 isa 和内存指针
    // todo
    
    // 4 KVC
    [object setValue:@"KVC_value" forKey:@"name"];
    NSLog(@"%@", [object performSelector:@selector(name)]);

}

@end
