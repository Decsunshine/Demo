//
//  myDay05ViewController.h
//  myDay05
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay05ViewController : UIViewController {
	IBOutlet UITextField *textField;
	IBOutlet UILabel *label;

}
@property (nonatomic,retain) UITextField *textField;
@property (nonatomic,retain) UILabel *label;

-(IBAction)Click;

@end

