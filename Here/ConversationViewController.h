//
//  ConversationViewController.h
//  Here
//
//  Created by Joshua J Coronado on 5/27/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"
@interface ConversationViewController : UITableViewController
@property (strong, nonatomic) Contacts *contact;
@end
