/*
 SEL method_getName(Method method);
 IMP method_getImplementation(Method method);
 const char * ivar_getTypeEncoding(Ivar ivar);
 */

#import "ViewController.h"
#import "ReplaceMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ReplaceMethod new] run];
}

@end
