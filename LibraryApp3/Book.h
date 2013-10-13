//
//  Book.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shelf.h"
@class Shelf;

@interface Book : NSObject
@property NSString *title;
@property Shelf *onThisShelf;

- (void) unShelf;
- (void) enShelf: (Shelf *) shelf;

@end
