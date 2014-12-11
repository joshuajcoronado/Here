//
//  Conversation.m
//  Here
//
//  Created by Joshua J Coronado on 5/24/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Conversation.h"

@implementation Conversation
-(NSArray *)conversation
{
    if(!_conversation){
        _conversation = [[NSArray alloc] init];
    }
    return _conversation;
}
@end
