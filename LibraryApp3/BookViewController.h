//
//  BookViewController.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/12/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Book;

@interface BookViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) Book *thisBook;
//@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *genrePicker;

- (IBAction)titleTextFieldChanged:(id)sender;
- (IBAction)destroyBook:(id)sender;

@end
