//
//  Voicemail.m
//  Here
//
//  Created by Joshua J Coronado on 5/23/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Voicemail.h"


@implementation Voicemail

- (instancetype)initWithDate:(NSDate *)date andSoundFile:(NSString *)fileName andFileType:(NSString *)fileType
{
    self = [super init];
    if(self) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocale:usLocale];
        self.date = [dateFormatter stringFromDate:date];

        self.soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:fileType]];
    }
    return self;
}




+ (NSArray *)getVoicemails
{
    NSMutableArray *voicemails = [[NSMutableArray alloc] init];
    
    NSArray *contacts = [Contacts getContacts];
    for (Contacts *contact in contacts)
    {
        for (Voicemail *vc in contact.voicemails){
            Voicemail *voicemail = vc;
            vc.contact = contact;
            [voicemails addObject:voicemail];
        }
    }
    return voicemails;
}
@end
