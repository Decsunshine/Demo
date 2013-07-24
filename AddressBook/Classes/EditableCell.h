//
//  EditableCell.h
//  AddressBook
//
//  Created by 路宏亮 on 12-3-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditableCellDelegate;

@interface EditableCell : UITableViewCell <UITextFieldDelegate>
{
	id<EditableCellDelegate>delegate;
	UITextField *textField;
	UILabel *label;
}

@property (nonatomic, retain) UITextField *textField;

@property (readonly, retain) UILabel *label;

@property (nonatomic, assign)id<EditableCellDelegate>delegate;

- (void)setLabelText:(NSString *)text;

- (void)clearText;


@end

@protocol EditableCellDelegate

- (void)editableCellDidBeginEditing:(EditableCell *)cell;

- (void)editableCellDidEndEditing:(EditableCell *)cell;

- (void)editableCellDidEndOnExit:(EditableCell *)cell;