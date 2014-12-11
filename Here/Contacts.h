//
//  Contacts.h
//  Here
//
//  Created by Joshua J Coronado on 5/23/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversation.h"
@interface Contacts : NSObject
- (instancetype)initWithName:(NSString *)contactName andImage:(UIImage *)image;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Conversation *conversation;
@property (strong, nonatomic) NSArray *voicemails;
@property (strong, nonatomic) UIImage *image;

+(NSArray *)getContacts;
@end
