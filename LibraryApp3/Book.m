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

- (Shelf *) unShelf {
  // doesn't actually delete, but method is called only when followed by enShelf
  return self.onThisShelf;
}

- (void) enShelf: (Shelf *) shelf {
  self.onThisShelf = shelf;
}

@end
