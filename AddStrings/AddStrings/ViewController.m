//
//  ViewController.m
//  AddStrings
//
//  Created by lu hongliang on 2019/3/24.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *result = [self addString:@"0" :@"345"];
    NSLog(@"result %@", result);
}

- (NSString *)addString:(NSString *)str1 :(NSString *)str2
{
    NSInteger result = 0;
    NSInteger carry = 1;
    while ((str1.length > 0) || (str2.length > 0)) {
        NSString *num1 = @"0";
        if (str1.length > 0) {
            num1 = [str1 substringFromIndex:str1.length - 1];
        }
        
        NSString *num2 = @"0";
        if (str2.length > 0) {
            num2 = [str2 substringFromIndex:str2.length - 1];
        }
        result = result + carry * ([num1 intValue] + [num2 intValue]);
        carry = carry * 10;
        if (str1.length > 0) {
            str1 = [str1 substringWithRange:NSMakeRange(0, (str1.length - 1))];
        }
        if (str2.length > 0) {
            str2 = [str2 substringWithRange:NSMakeRange(0, (str2.length - 1))];
        }
    }
    return [@(result) stringValue];
}

@end
