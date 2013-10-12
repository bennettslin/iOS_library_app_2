//
//  LibrariesTableViewController.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LibraryDataController;

@interface LibrariesTableViewController : UITableViewController
@property (nonatomic, strong) LibraryDataController *libraryDataController;
//@property (nonatomic, strong) NSArray *libraries;

@end
