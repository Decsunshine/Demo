//
//  myDay05ViewController.m
//  myDay05
//
//  Created by 路宏亮 on 12-2-23.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "myDay05ViewController.h"

@implementation myDay05ViewController

@synthesize textField, label;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	label.text	=	@"please import something";
}

-(IBAction)Click{
	int textCount	=	textField.text.length;
	
	if(textCount>30){
		label.text	=	@"您输入的文字包括标点和空格，假定文字的长度不能超过30个字母。 ";
		textField.text	= NULL;
	}
	else {
		NSString	*result	=	[NSString stringWithFormat:@ "您输入的文字长度为: %d", textCount];
		label.text	=	result;
		textField.text	=	NULL;
	}

}

- (void)dealloc {
	[label release];
	[textField release];
    [super dealloc];
}

@end
