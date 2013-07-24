//
//  myDay11ViewController.h
//  myDay11
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay11ViewController : UIViewController {

	IBOutlet UILabel *counter;
	NSInteger count;
}

@property (nonatomic,retain) UILabel *counter;

-(IBAction) addUnit;
-(IBAction) subtractUnit;
-(IBAction) reset;

@end

