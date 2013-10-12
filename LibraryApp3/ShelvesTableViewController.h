//
//  ShelvesTableViewController.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Library;

@interface ShelvesTableViewController : UITableViewController
//@property (nonatomic, strong) NSArray *shelves;
@property (nonatomic, strong) Library *inThisLibrary;

@end
