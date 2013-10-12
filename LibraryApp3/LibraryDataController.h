//
//  LibraryDataController.h
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Library;

@interface LibraryDataController : NSObject
@property (nonatomic, copy) NSMutableArray *masterLibraryList;

-(NSUInteger)countOfMasterLibraryList;
-(Library *)objectInMasterLibraryListAtIndex:(NSUInteger)theIndex;
-(void)addLibraryWithLibraryDetails:(Library *)libraryDetails;

@end
