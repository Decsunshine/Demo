//
//  ViewController.m
//  StringOperation
//
//  Created by lu hongliang on 2019/3/24.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"sdaf12as3dfw1erdwvlckq12jsaldkfjklkdjs934523jklad";

    // search
    NSRange range = [string rangeOfString:@"12"];
    if (range.location == NSNotFound) {
        NSLog(@"nothing");
    } else {
        NSLog(@"搜索范围 %@",NSStringFromRange(range));
    }

    range = [string rangeOfString:@"12"
                          options:NSLiteralSearch  // 区分大小写
                            range:NSMakeRange(0, string.length)];
    range = [string rangeOfString:@"12"
                          options:NSCaseInsensitiveSearch];  // 不区分大小写
    if (range.location == NSNotFound) {
        NSLog(@"nothing");
    } else {
        NSLog(@"搜索范围 %@",NSStringFromRange(range));
    }
    
    BOOL result = [string containsString:@"12"];
    if (result) {
        NSLog(@"get");
    }
    
    // Intercept
    NSString *bStr = [string substringWithRange:NSMakeRange(0, 1)];
    NSLog(@"bStr %@", bStr);

    NSString *cStr = [string substringToIndex:2]; // 从首位开始截取字符
    NSLog(@"cStr %@", cStr);
    
    NSString *dStr = [string substringFromIndex:2]; // 从第 n+1 位开始截取字符，至字符串最后
    NSLog(@"dStr %@", dStr);
    
    // split
    NSArray *array = [string componentsSeparatedByString:@"12"]; // 从字符 12 中分隔
    NSLog(@"array:%@",array);
    
    // replace
    NSString *replacedStr = [string stringByReplacingOccurrencesOfString:@"345" withString:@"想要替换成的字符串"];
    NSLog(@"replacedStr %@", replacedStr);
    
    // verification
    BOOL hasPrefix = [string hasPrefix:@"sdaf12as3dfw1"]; // 是否是以 sdaf12as3dfw1 开头
    if (hasPrefix) {
        NSLog(@"hasPrefix");
    }
    BOOL hasSuffix = [string hasSuffix:@"fwdvwefwefew"];  // 文件路径是否以 fwdvwefwefew 结尾
    if (hasSuffix) {
        NSLog(@"hasSuffix");
    }
    
    // toBoolen
    BOOL boolValue = [@"1" boolValue];
    NSLog(@"boolValue %d", boolValue);
    
    // toInteger
    NSInteger integer = [@"12" integerValue];
    NSLog(@"integer %ld", (long)integer);
    
    // upperCase
    NSString *upperCase = [string uppercaseString]; // 转成大写
    NSLog(@"upperCase %@", upperCase);
    
    // lowerCase
    NSString *lowerCase = [string lowercaseString]; // 转成小写
    NSLog(@"lowerCase %@", lowerCase);

    // capitalized
    NSString *capitalized = [string capitalizedString]; // 首字母大写，其余小写
    NSLog(@"capitalized %@", capitalized);

    // encode
    NSString *encodeString = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet controlCharacterSet]];
    NSLog(@"encodeString %@", encodeString);
    
    // decode
    NSString *decodeString = [encodeString stringByRemovingPercentEncoding];
    NSLog(@"decodeString %@", decodeString);
}

@end
