//
//  myDay17ViewController.h
//  myDay17
//
//  Created by 路宏亮 on 12-2-26.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay17ViewController : UIViewController {

	IBOutlet UIPickerView *picker;
	IBOutlet UILabel *winLabel;
    NSArray *column1;
	NSArray *column2;
	NSArray *column3;
	NSArray *column4;
	NSArray *column5;


}

@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) UILabel *winLabel;

@property (nonatomic, retain) NSArray *column1;
@property (nonatomic, retain) NSArray *column2;
@property (nonatomic, retain) NSArray *column3;
@property (nonatomic, retain) NSArray *column4;
@property (nonatomic, retain) NSArray *column5;

-(IBAction)spin;

@end

