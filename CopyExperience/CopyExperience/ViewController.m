/*
 NSMutableString *immutableString = [[NSMutableString string] copy]; // 得到的是一个 __NSCFConstantString
 [immutableString appendString:@"cc"]; // 会闪退，因为 NSString 不支持 appendString API
 NSMutableString *mutableString = [[NSMutableString string] mutableCopy]; // 得到的是一个 __NSCFString
 */
#import "ViewController.h"
#import "DeepCopy.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DeepCopy new] run];
}

@end
