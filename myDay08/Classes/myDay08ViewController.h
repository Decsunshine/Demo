//
//  myDay08ViewController.h
//  myDay08
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay08ViewController : UIViewController {

	IBOutlet UILabel *result;
}

@property (nonatomic,retain) UILabel *result;

-(IBAction)agreeDisagree;

-(IBAction)leftCenterRight;

-(IBAction)oneToHundred;

-(IBAction)russianRoulette;

@end

