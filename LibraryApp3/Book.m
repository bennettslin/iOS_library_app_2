//
//  Book.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "Book.h"

@implementation Book

// overrides description with title
//- (NSString *) description {
//  return self.title;
//}

- (void) unShelf {
  [self.onThisShelf removeBook:self];
}

- (void) enShelf: (Shelf *) shelf {
  [shelf addBook:self];
}

@end
