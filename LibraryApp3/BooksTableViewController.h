//
//  BooksTableViewController.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shelf;

@interface BooksTableViewController : UITableViewController
//@property (nonatomic, strong) NSArray *books;
@property (nonatomic, strong) Shelf *onThisShelf;
//@property (nonatomic, strong) NSString *shelfGenre;

@end
