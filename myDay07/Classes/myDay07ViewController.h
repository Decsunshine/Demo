//
//  myDay07ViewController.h
//  myDay07
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay07ViewController : UIViewController {
	IBOutlet UITextField *chi;
	IBOutlet UITextField *meter;
	IBOutlet UITextField *feet;
}

@property (nonatomic, retain) UITextField *chi;
@property (nonatomic, retain) UITextField *meter;
@property (nonatomic, retain) UITextField *feet;

-(IBAction)reset;

@end

