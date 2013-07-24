//
//  myDay12ViewController.h
//  myDay12
//
//  Created by 路宏亮 on 12-2-25.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface myDay12ViewController : UIViewController {

	NSData *startDate;
	IBOutlet UIImageView *pokerImage;
}

@property (nonatomic, retain) UIImageView *pokerImage;

@property (nonatomic, copy) NSData *startDate;

-(IBAction) pokerPressed;

@end

