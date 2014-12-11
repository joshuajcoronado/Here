//
//  ContactsTableViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/21/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "Contacts.h"
#import "ConversationViewController.h"
@interface ContactsTableViewController ()
@property (strong, nonatomic) NSArray *contacts;
@end

@implementation ContactsTableViewController

- (NSArray *)contacts
{
    if (!_contacts){
        NSMutableArray *contacts = [[NSMutableArray alloc] initWithArray:[Contacts getContacts]];
        for(NSInteger i = 0; i < [contacts count]; i++){
            Contacts *contact = contacts[i];
            if([contact.conversation.conversation count] == 0){
                [contacts removeObject:contact];
                i--;
            }
        }
        _contacts = contacts;
    }
    return _contacts;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _contacts = nil;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init] ;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _contacts = nil;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Contact" forIndexPath:indexPath];
    Contacts *contact = self.contacts[indexPath.row];
    UIImageView *imageView = cell.imageView;
    [imageView setImage:contact.image];
    cell.textLabel.text = contact.name;
    CGRect imageFrame = imageView.frame;
    imageFrame.origin.x = 0;
    imageView.frame = imageFrame;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld Messages", (unsigned long)[contact.conversation.conversation count]];
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    
    id destVC = segue.destinationViewController;
    if (indexPath && [destVC isKindOfClass:[ConversationViewController class]]) {
        if ([segue.identifier isEqualToString:@"ConversationSegue"]) {
            ConversationViewController *convoVC = (ConversationViewController *)destVC;
            convoVC.contact = self.contacts[indexPath.row];
    
        }
    }
}

@end
