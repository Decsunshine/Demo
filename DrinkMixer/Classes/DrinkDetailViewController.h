//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by 路宏亮 on 12-3-4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkDetailViewController : UIViewController {
	
	NSDictionary *drink;
	
	IBOutlet UITextField *nameTextField;
	
	IBOutlet UITextView *ingredientsTextView;
	
	IBOutlet UITextView *directionsTextView;
	
	IBOutlet UIScrollView* scrollView;

}

@property (nonatomic, retain) UIScrollView* scrollView;

@property (nonatomic, retain) NSDictionary *drink;

@property (nonatomic, retain) UITextField *nameTextField;

@property (nonatomic, retain) UITextView *ingredientsTextView;

@property (nonatomic, retain) UITextView *directionsTextView;

@end
