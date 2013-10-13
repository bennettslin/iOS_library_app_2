//
//  Shelf.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@class Library;
@class Book;

@interface Shelf : NSObject
@property NSString *genre;
@property NSMutableArray *all_books;
@property Library *inThisLibrary;

- (void) createBook: (NSString *) title;
- (void) seedBooks;
- (void) removeBook: (Book *) book;
- (void) addBook: (Book *) book;

@end
