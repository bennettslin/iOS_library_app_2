//
//  BooksTableViewController.m
//  LibraryApp3
//
//  Created by Bennett Lin on 10/11/13.
//  Copyright (c) 2013 Bennett Lin. All rights reserved.
//

#import "LibraryDataController.h"
#import "BooksTableViewController.h"
#import "BookViewController.h"
#import "Shelf.h"

@interface BooksTableViewController ()

@end

@implementation BooksTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTapped:)];
  
//    self.books = @[@"Book 1", @"Book 2"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
// return to previous view will reflect edited data
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.onThisShelf.all_books count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"aBookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  cell.detailTextLabel.text = [self.onThisShelf.genre capitalizedString];
  cell.textLabel.text = [self.onThisShelf.all_books[indexPath.row] title];
    // Configure the cell...
    
    return cell;
}

-(void)addTapped:(id)sender {
  
  [self.onThisShelf createBook:@"New Book"];
  
  NSLog(@"%i is the indexPath row", [self.onThisShelf.all_books count] - 1);
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.onThisShelf.all_books count] - 1) inSection:0];
  NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
  [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
  NSLog(@"%i is the indexPath row", indexPath.row);
  [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//  [self performSegueWithIdentifier:@"bookCellPressed" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"bookCellPressed"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    Book *thisBook = self.onThisShelf.all_books[indexPath.row];
    
    BookViewController *bvc = [segue destinationViewController];
    bvc.thisBook = thisBook;
  }
  
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
