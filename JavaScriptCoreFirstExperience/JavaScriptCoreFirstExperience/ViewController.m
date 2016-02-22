//
//  ViewController.m
//  JavaScriptCoreFirstExperience
//
//  Created by honglianglu on 2/19/16.
//  Copyright © 2016 decsunshine. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JSContext *context = [[JSContext alloc] init];
    
    // 🌰 1
    JSValue *jsVal = [context evaluateScript:@"21+7"];
    int iVal = [jsVal toInt32];
    NSLog(@"JSValue: %@, int: %d", jsVal, iVal);
    
    
    // 🌰 2
    [context evaluateScript:@"var arr = [21, 7, 'cc'];"];
    JSValue *jsArr = context[@"arr"];
    
    NSLog(@"JS Array: %@;   Length: %@", jsArr, jsArr[@"length"]);
    jsArr[1] = @"blog";
    jsArr[7] = @7;
    
    NSLog(@"JS Array: %@;   Length: %d", jsArr, [jsArr[@"length"] toInt32]);
    
    NSArray *nsArr = [jsArr toArray];
    NSLog(@"NSArray: %@", nsArr);
    
    // 🌰 3
    context[@"log"] = ^() {
        NSLog(@"++++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
        JSValue *this = [JSContext currentThis];
        NSLog(@"this: %@", this);
        NSLog(@"++++++++End Log+++++++");
    };
    [context evaluateScript:@"log('ider', [7,21], { hello:'world', js:100});"];
    
    // 🌰 4
    [context evaluateScript:@"function add(a, b) { return a +b;} "];
    JSValue *add = context[@"add"];
    NSLog(@"Func: %@", add);
    JSValue *sum = [add callWithArguments:@[@(7), @(21)]];
    NSLog(@"Sum: %d", [sum toInt32]);
}

@end
