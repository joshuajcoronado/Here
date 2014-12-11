//
//  Voicemail.h
//  Here
//
//  Created by Joshua J Coronado on 5/23/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contacts.h"
@interface Voicemail : NSObject

- (instancetype)initWithDate:(NSDate *)date andSoundFile:(NSString *)fileName andFileType:(NSString *)fileType;

@property (nonatomic, strong) Contacts *contact;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *soundFile;
+ (NSArray *)getVoicemails;
@end
