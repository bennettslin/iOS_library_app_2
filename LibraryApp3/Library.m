//
//  Library.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "Library.h"

@implementation Library

-(id)initWithBranch:(NSString *)branch {
//  NSLog(@"The initWithBranch method is being run.");
  self = [super init];
  if (self) {
    _branch = branch;
    self.all_shelves = [[NSMutableArray alloc] init];
//    NSLog(@"The if statement inside the initWithBranch method is being run.");
    return self;
  }
  return nil;
}

//- (void) initialize {
//  self.all_shelves = [[NSMutableArray alloc] init];
//}

- (void) createShelf: (NSString *) genre {
  Shelf *new_shelf = [[Shelf alloc] init];
  new_shelf.genre = genre;
  new_shelf.inThisLibrary = self;
  new_shelf.all_books = [[NSMutableArray alloc] init];
  [new_shelf seedBooks];
  [self.all_shelves addObject:new_shelf];
}

- (void) reportShelves {
  unsigned long int shelf_count = [self.all_shelves count];
  NSLog(@"%lu shelves in library.", shelf_count);
  for (id shelf in self.all_shelves) {
    NSLog(@"%@", [[shelf genre] uppercaseString]);
    for (id book in [shelf all_books]) {
      NSLog(@" %@", [book title]);
    }
  }
}

- (void) seedShelves {
  NSArray *seed_shelves = [NSArray arrayWithObjects:
                           @"fantasy", @"romance", @"nonfiction", nil];
  for (id shelf in seed_shelves)
    [self createShelf: shelf];
}

- (Book *) searchForBook: (NSString *) title {
  for (id shelf in [self all_shelves]) {
    for (id book in [shelf all_books]) {
      if ([[book title] isEqualToString: title]) {
        return book;
      }
    }
  }
  return 0;
}

- (Shelf *) searchForShelf: (NSString *) genre {
  for (id shelf in [self all_shelves]) {
    if ([[shelf genre] isEqualToString: genre]) {
      return shelf;
    }
  }
  return 0;
}

//- (BOOL) reShelfBook: (NSString *) title ontoShelf: (NSString *) genre {
//  
//  // searches for book by title, returns book and shelf if found
//  Book *book = [self searchForBook: title];
//  if (book == 0) {
//    NSLog(@"That book can't be found.");
//    return NO;
//  }
//  
//  // searches for shelf by genre
//  Shelf *new_shelf = [self searchForShelf: genre];
//  if (new_shelf == 0) {
//    NSLog(@"That shelf can't be found.");
//    return NO;
//  }
//  
//  // reshelves book
//  Shelf *old_shelf = [book unShelf];
//  [old_shelf removeBook: book];
//  [new_shelf addBook: book];
//  [book enShelf: new_shelf];
//  NSLog(@"Moved %@ from %@ to %@ shelf.",
//        book.title, old_shelf.genre, new_shelf.genre);
//  return YES;
//}

@end