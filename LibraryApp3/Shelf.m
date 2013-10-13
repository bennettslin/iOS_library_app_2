//
//  Shelf.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "Shelf.h"

@implementation Shelf

- (void) createBook: (NSString *) title {
  Book *new_book = [[Book alloc] init];
  new_book.title = title;
  new_book.onThisShelf = self;
  //  NSLog(@"What is this: %@", new_book.onThisShelf);
  [self.all_books addObject:new_book];
}

// overrides description with genre
//- (NSString *) description {
//  return self.genre;
//}

- (void) seedBooks {
  NSArray *seed_books = [NSArray alloc];
  
  if ([self.genre isEqual: @"romance"])
    seed_books = [seed_books initWithObjects: @"Pride and Prejudice", @"Wuthering Heights", nil];
  
  else if ([self.genre isEqual: @"fantasy"])
    seed_books = [seed_books initWithObjects: @"Beowulf", @"Lord of the Rings", nil];
  
  else if ([self.genre isEqual: @"nonfiction"])
    seed_books = [seed_books initWithObjects: @"Computer Music", @"Social Psychology", nil];
  
  for (id book in seed_books) {
    [self createBook: book];
  }
}

- (void) removeBook: (Book *) book {
  [self.all_books removeObject: book];
  NSLog(@"There are now %i books on the %@ shelf after removing.", [self.all_books count], self.genre);
}

- (void) addBook: (Book *) book {
  [self.all_books addObject: book];
  NSLog(@"There are now %i books on the %@ shelf after adding.", [self.all_books count], self.genre);
}

@end
