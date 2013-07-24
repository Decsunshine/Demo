//
//  myDay10ViewController.h
//  myDay10
//
//  Created by 路宏亮 on 12-2-24.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface myDay10ViewController : UIViewController {

	IBOutlet UILabel *time;
	
	NSTimer *myday10Ticker;
	
	
}

@property (nonatomic,retain) UILabel *time;

@property (nonatomic,retain) NSTimer *myday10Ticker;

-(IBAction)start;

-(IBAction)reset;

-(IBAction)stop;

-(void)showAct;

@end

