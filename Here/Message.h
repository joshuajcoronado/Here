//
//  Message.h
//  Here
//
//  Created by Joshua J Coronado on 5/24/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
- (instancetype)initWithMessage:(NSString *)message andSelf:(BOOL)isSelf;
@property (nonatomic, getter = isSelf) BOOL self;
@property (nonatomic, strong) NSString *message;

#define SELF YES
#define OTHER  NO
@end
