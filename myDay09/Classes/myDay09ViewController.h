//
//  myDay09ViewController.h
//  myDay09
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay09ViewController : UIViewController {

	IBOutlet UITextField *passwordlength;
	IBOutlet UITextField *password;
	IBOutlet UISwitch *includeUpperCase;
	IBOutlet UISwitch *includeLowerCase;
	IBOutlet UISwitch *includeNumbers;
}

@property (nonatomic,retain) UITextField *passwordlength;
@property (nonatomic,retain) UITextField *password;
@property (nonatomic,retain) UISwitch *includeLowerCase;
@property (nonatomic,retain) UISwitch *includeUpperCase;
@property (nonatomic,retain) UISwitch *includeNumbers;

-(IBAction)setPassword;

@end

