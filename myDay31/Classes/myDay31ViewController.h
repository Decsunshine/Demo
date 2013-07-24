//
//  myDay31ViewController.h
//  myDay31
//
//  Created by 路宏亮 on 12-3-16.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay31ViewController : UIViewController {

	IBOutlet UILabel *userOutput;
	IBOutlet UITextField *userInput;
}
 
@property (retain, nonatomic)UITextField *userInput;
@property (retain, nonatomic)UILabel *userOutput;

- (IBAction)setOutput:(id)sender;

- (IBAction)hideKeyboard:(id)sender;

@end

