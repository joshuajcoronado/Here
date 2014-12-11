//
//  ConversationViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/27/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "ConversationViewController.h"
#import "Message.h"
@interface ConversationViewController ()

@end

@implementation ConversationViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.contact.name;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.contact.conversation)
    {
        return [self.contact.conversation.conversation count];
    }else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Message" forIndexPath:indexPath];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    Message *message =self.contact.conversation.conversation[indexPath.row];
    cell.textLabel.attributedText = [[NSAttributedString alloc] initWithString:message.message];
    if(message.isSelf == SELF){
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
    }else{
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    return cell;
}

#define MARGIN 50
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *message =self.contact.conversation.conversation[indexPath.row];
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:[[NSAttributedString alloc] initWithString:message.message]];
    CGSize size = [textView sizeThatFits:CGSizeMake(self.tableView.bounds.size.width, FLT_MAX)];
    return size.height + MARGIN;
}

@end
