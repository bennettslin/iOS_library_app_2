//
//  LibraryDataController.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "LibraryDataController.h"
#import "Library.h"

@interface LibraryDataController ()
-(void)initializeDefaultDataList;
@end

@implementation LibraryDataController

-(id)init {
  if (self = [super init]) {
    [self initializeDefaultDataList];
    return self;
  }
  return nil;
}

-(void)initializeDefaultDataList {
  NSMutableArray *libraryList = [[NSMutableArray alloc] init];
  self.masterLibraryList = libraryList;
//  NSLog(@"The initializeDefault DataList method is being run.");
  NSArray *branches = @[@"Seattle", @"Portland", @"Vancouver"];
  for (NSString *city in branches) {
  Library *libraryDetails = [[Library alloc] initWithBranch:city];
  [libraryDetails seedShelves];
  [self addLibraryWithLibraryDetails:libraryDetails];
  }
}

-(void)setMasterLibraryList:(NSMutableArray *)newList {
  if (_masterLibraryList != newList) {
    _masterLibraryList = [newList mutableCopy];
  }
}

-(NSUInteger)countOfMasterLibraryList {
//  NSLog(@"%i is the count of the list", [self.masterLibraryList count]);
  return [self.masterLibraryList count];
}

-(Library *)objectInMasterLibraryListAtIndex:(NSUInteger)theIndex {
  return [self.masterLibraryList objectAtIndex:theIndex];
}

-(void)addLibraryWithLibraryDetails:(Library *)libraryDetails {
  [self.masterLibraryList addObject:libraryDetails];
}

@end
