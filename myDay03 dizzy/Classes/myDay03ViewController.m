//
//  myDay03ViewController.m
//  myDay03
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay03ViewController.h"

@implementation myDay03ViewController
 
@synthesize lblText, lblSlider, lblColor, lblToogle, label;

- (void)viewDidLoad {
    [super viewDidLoad];
	label.text= @"nono";
	
	NSString *textValue	=	[[NSUserDefaults standardUserDefaults]stringForKey:@ "textEntry_key"];
	NSString *sliderValue	=	[[NSUserDefaults standardUserDefaults]stringForKey:@ "slider_key"];
	NSString *colorValue	=	[[NSUserDefaults standardUserDefaults]stringForKey:@ "colors_key"];
	NSString *toogleValue	=	[[NSUserDefaults standardUserDefaults]stringForKey:@ "toogle_key"];
	lblText.text = [NSString stringWithFormat:@"输入的文字: %@"	,	textValue];
	lblSlider.text	=	[NSString stringWithFormat:@"划块的值: %@"	,	sliderValue];
	lblColor.text	=	[NSString stringWithFormat:@"颜色设定的值: %@"	,	colorValue];
	lblToogle.text	=	[NSString stringWithFormat:@"切换控制的值: %@"	,	toogleValue];
}

- (void)dealloc {
	[lblText release];
	[lblSlider release];
	[lblColor release];
	[lblToogle release];
	[label release];

    [super dealloc];
}

@end
