//
//  EditableCell.m
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EditableCell.h"


@implementation EditableCell

@synthesize textField;
@synthesize label;
@synthesize delegate;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 0, 20)];
		
		textField = [[textField alloc] initWithFrame:CGRectMake(0, 10, 0, 20)];
		
		[textField setDelegate:self];
		
		[textField addTarget:self action:@selector(textFieldDidEndOnExit) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self.contentView addSubview:label];
		[self.contentView addSubview:textField];
    }
    return self;
}

- (void)textFieldDidEndOnExit
{
	[textField resignFirstResponder];
	[delegate editableCellDidEndOnExit:self];
	
}

- (void)setLabelText:(NSString *)text
{
	label.text = text;
	
	CGSize size = [text sizeWithFont:label.font];
	CGRect labelFrame = label.frame;
	labelFrame.size.width = size.width;
	label.frame = labelFrame;
	
	CGRect textFieldFrame = textField.frame;
	textFieldFrame.origin.x = size.width + 30;
	
	textFieldFrame.size.width = self.frame.size.width - textFieldFrame.origin.x;
	textField.frame = textFieldFrame;
}

- (void)clearText
{

	textField.text = @ "";
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[delegate editableCellDidBeginEditing:self];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[delegate editableCellDidEndEditing:self];
}

- (void)dealloc {
	[textField release];
	[label release];
    [super dealloc];
}


@end
