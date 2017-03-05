/*
 2016-03-10 21:04:18.758 CopyExperience[88585:3179931] sampleStringA : stringA, address: 0x1025a40d0
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] dcStrongString : stringA, address: 0x1025a40d0
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] sampleStringX : stringB, address: 0x1025a40f0
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] sampleStringB : stringB, address: 0x1025a40f0
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] dcCopayString : stringB, address: 0x1025a40f0
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] ----------------------------------------------------
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] sampleStringC : stringC_suffix, address: 0x7fe301605610
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] dcStrongString : stringC_suffix, address: 0x7fe301605610
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] sampleStringD : stringD_suffix, address: 0x7fe301603650
 2016-03-10 21:04:18.759 CopyExperience[88585:3179931] dcCopayString : stringD, address: 0xa44676e697274737
 2016-03-10 21:04:18.760 CopyExperience[88585:3179931] ----------------------------------------------------
 2016-03-10 21:04:18.760 CopyExperience[88585:3179931] sampleStringE : stringE, address: 0x1025a4270
 2016-03-10 21:04:18.760 CopyExperience[88585:3179931] dcCopayString : stringE, address: 0x1025a4270
 2016-03-10 21:04:18.790 CopyExperience[88585:3179931] sampleStringF : stringF, address: 0x7fe3016066b0
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] dcCopayString : stringF, address: 0xa46676e697274737
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] ---------------------------------------------------
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] sampleStringG : stringG, address: 0x7fe301604f30
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] dcStrongString : stringG, address: 0x7fe30160bde0
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] sampleStringH : stringH, address: 0x7fe301522dd0
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] dcCopayString : stringH, address: 0xa48676e697274737 // 这个地址长一些，存疑
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] ---------------------------------------------------
 2016-03-10 21:04:18.791 CopyExperience[88585:3179931] sampleStringL : stringL, address: 0x1025a4390
 2016-03-10 21:04:18.792 CopyExperience[88585:3179931] dcStrongString : stringL, address: 0x7fe30140a9d0
 2016-03-10 21:04:18.792 CopyExperience[88585:3179931] sampleStringI : stringI, address: 0x1025a43d0
 2016-03-10 21:04:18.792 CopyExperience[88585:3179931] dcCopayString : stringI, address: 0xa49676e697274737
 2016-03-10 21:04:18.792 CopyExperience[88585:3179931] ---------------------------------------------------
 */
#import "DeepCopy.h"

@interface DeepCopy ()

@property (nonatomic, strong) NSString *dcStrongString;
@property (nonatomic, copy) NSString *dcCopyString;

@end

@implementation DeepCopy

- (void)run
{
    NSString *sampleStringA = @"stringA";
    NSString *sampleStringB = @"stringB";
    NSString *sampleStringX = @"stringB";
    
    self.dcStrongString = sampleStringA;
    self.dcCopyString = sampleStringB;
    
    NSLog(@"sampleStringA : %@, address: %p", sampleStringA, sampleStringA);
    NSLog(@"dcStrongString : %@, address: %p", self.dcStrongString, self.dcStrongString);
    
    NSLog(@"sampleStringX : %@, address: %p", sampleStringX, sampleStringX);  // sampleStringX 与 sampleStringB 的地址一样，应该是编译器优化
    
    NSLog(@"sampleStringB : %@, address: %p", sampleStringB, sampleStringB);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"----------------------------------------------------");

    NSMutableString *sampleStringC = [NSMutableString stringWithString:@"stringC"];
    NSMutableString *sampleStringD = [NSMutableString stringWithString:@"stringD"];

    self.dcStrongString = sampleStringC;
    self.dcCopyString = sampleStringD;

    [sampleStringC appendString:@"_suffix"]; // strong 修饰，会被外界修改数值
    [sampleStringD appendString:@"_suffix"];

    NSLog(@"sampleStringC : %@, address: %p", sampleStringC, sampleStringC);
    NSLog(@"dcStrongString : %@, address: %p", self.dcStrongString, self.dcStrongString);
    NSLog(@"sampleStringD : %@, address: %p", sampleStringD, sampleStringD);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"----------------------------------------------------");
    
    NSString *sampleStringE = @"stringE";
    self.dcCopyString = sampleStringE; // 如果赋值的是不可变的，则指针拷贝
    NSLog(@"sampleStringE : %@, address: %p", sampleStringE, sampleStringE);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSMutableString *sampleStringF = [NSMutableString stringWithString:@"stringF"];
    self.dcCopyString = sampleStringF; // 如果赋值的是可变的，则内容拷贝
    NSLog(@"sampleStringF : %@, address: %p", sampleStringF, sampleStringF);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"---------------------------------------------------");
    
    NSMutableString *sampleStringG = [NSMutableString stringWithString:@"stringG"];
    self.dcStrongString = [sampleStringG mutableCopy];
    NSLog(@"sampleStringG : %@, address: %p", sampleStringG, sampleStringG);
    NSLog(@"dcStrongString : %@, address: %p", self.dcStrongString, self.dcStrongString);
    
    NSMutableString *sampleStringH = [NSMutableString stringWithString:@"stringH"];
    self.dcCopyString = [sampleStringH mutableCopy];
    NSLog(@"sampleStringH : %@, address: %p", sampleStringH, sampleStringH);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"---------------------------------------------------");
    
    NSString *sampleStringL = @"stringL";
    self.dcStrongString = [sampleStringL mutableCopy];
    NSLog(@"sampleStringL : %@, address: %p", sampleStringL, sampleStringL);
    NSLog(@"dcStrongString : %@, address: %p", self.dcStrongString, self.dcStrongString);
    
    NSString *sampleStringI = @"stringI";
    self.dcCopyString = [sampleStringI mutableCopy];
    NSLog(@"sampleStringI : %@, address: %p", sampleStringI, sampleStringI);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"---------------------------------------------------");
    
    NSString *sampleStringO = [NSMutableString stringWithString:@"stringO"];
    self.dcStrongString = [sampleStringO copy];
    NSLog(@"sampleStringO : %@, address: %p", sampleStringO, sampleStringO);
    NSLog(@"dcStrongString : %@, address: %p", self.dcStrongString, self.dcStrongString);
    
    NSString *sampleStringP = [NSMutableString stringWithString:@"stringP"];
    self.dcCopyString = [sampleStringP copy];
    NSLog(@"sampleStringP : %@, address: %p", sampleStringP, sampleStringP);
    NSLog(@"dcCopayString : %@, address: %p", self.dcCopyString, self.dcCopyString);
    
    NSLog(@"---------------------------------------------------");
}

@end
