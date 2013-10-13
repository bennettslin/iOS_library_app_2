//
//  BookViewController.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/12/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "BookViewController.h"
#import "Book.h"
#import "Library.h"

@interface BookViewController ()

@end

@implementation BookViewController

-(void)viewWillAppear:(BOOL)animated {
  self.title = [NSString stringWithFormat:@"%@ branch", self.thisBook.onThisShelf.inThisLibrary.branch];
//  self.titleLabel.text = self.thisBook.title;
  self.titleTextField.text = self.thisBook.title;
  int index = [self.thisBook.onThisShelf.inThisLibrary.all_shelves indexOfObject:self.thisBook.onThisShelf];
  NSLog(@"The index number is %i", index);
  [self.genrePicker selectRow:index inComponent:0 animated:YES];
}

#pragma mark UITextFieldDelegate

-(IBAction)titleTextFieldChanged:(id)sender {
  self.thisBook.title = self.titleTextField.text;
}

- (IBAction)destroyBook:(id)sender {
  [self.thisBook unShelf];
  // goes back one level up the navigation stack
  [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [self.thisBook.onThisShelf.inThisLibrary.all_shelves count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return [[self.thisBook.onThisShelf.inThisLibrary.all_shelves objectAtIndex:row] genre];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  Shelf *newShelf = self.thisBook.onThisShelf.inThisLibrary.all_shelves[row];
  NSLog(@"%@ is the new genre.", newShelf.genre);
  [self.thisBook unShelf];
  [self.thisBook enShelf:newShelf];
  self.thisBook.onThisShelf = newShelf;
  NSLog(@"%@ is the new genre.", self.thisBook.onThisShelf.genre);
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end