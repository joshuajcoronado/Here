//
//  Message.m
//  Here
//
//  Created by Joshua J Coronado on 5/24/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Message.h"

@implementation Message
-(instancetype)initWithMessage:(NSString *)message andSelf:(BOOL)isSelf
{
    self = [super init];
    if(self) {
        self.message = message;
        self.self = isSelf;
    }
    return self;
}
@end
