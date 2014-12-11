//
//  Contacts.m
//  Here
//
//  Created by Joshua J Coronado on 5/23/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Contacts.h"
#import "Voicemail.h"
#import "Conversation.h"
#import "Message.h"

@implementation Contacts
#define BROTHER @"Brother"
#define FATHER @"Dad"
#define BEST_FRIEND @"Sam"
#define EXGF @"Natasha"

- (instancetype)initWithName:(NSString *)contactName andImage:(UIImage *)image
{
    self = [super init];
    if(self) {
        self.name = contactName;
        self.image = image;
    }
    return self;
}

-(Conversation *)conversation{
    if(!_conversation){
        _conversation = [[Conversation alloc] init];
    }
    return _conversation;
}

-(NSArray *)voicemails
{
    if(!_voicemails){
        _voicemails = [[NSArray alloc] init];
    }
    return _voicemails;
}
+(NSArray *)contacts{
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    [contacts addObject:[[Contacts alloc] initWithName:BROTHER andImage:[UIImage imageNamed:@"brother.jpg"]]];
    [contacts addObject:[[Contacts alloc] initWithName:FATHER andImage:[UIImage imageNamed:@"dad.jpg"]]];
    [contacts addObject:[[Contacts alloc] initWithName:BEST_FRIEND andImage:[UIImage imageNamed:@"best_friend.jpg"]]];
    [contacts addObject:[[Contacts alloc] initWithName:EXGF andImage:[UIImage imageNamed:@"exgf.jpg"]]];
    return contacts;
}

+(void)start:(NSArray *)contacts
{
    for(Contacts *contact in contacts){
        if([contact.name isEqualToString:EXGF]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Remember what is was like? " andSelf:SELF]];
            contact.conversation.conversation = convo;
            
            NSMutableArray *voicemails = [[NSMutableArray alloc] init];
            Voicemail *voicemail = [[Voicemail alloc] initWithDate:[NSDate date] andSoundFile:@"01 Know Where" andFileType:@"mp3"];
            [voicemails addObject:voicemail];
            [voicemails addObjectsFromArray:contact.voicemails];
            contact.voicemails = voicemails;
            
        }else if([contact.name isEqualToString:BROTHER]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Where you at man? I need you. " andSelf:SELF]];
            contact.conversation.conversation = convo;
        }else if([contact.name isEqualToString:FATHER]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"It's going fine." andSelf:SELF]];
            contact.conversation.conversation = convo;
        }else if([contact.name isEqualToString:BEST_FRIEND]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Where you at man?  It's going okay." andSelf:SELF]];
            contact.conversation.conversation = convo;
        }
    }
}

+(void)lakecontacts:(NSArray *)contacts
{
    for(Contacts *contact in contacts){
        if([contact.name isEqualToString:EXGF]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"You need to stop texting me. " andSelf:OTHER]];
            contact.conversation.conversation = convo;
            
        }else if([contact.name isEqualToString:BROTHER]){
            NSMutableArray *voicemails = [[NSMutableArray alloc] init];
            Voicemail *voicemail = [[Voicemail alloc] initWithDate:[NSDate date] andSoundFile:@"02 Yr Love" andFileType:@"mp3"];
            [voicemails addObject:voicemail];
            [voicemails addObjectsFromArray:contact.voicemails];
            contact.voicemails = voicemails;
        }else if([contact.name isEqualToString:FATHER]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Call me" andSelf:SELF]];
            contact.conversation.conversation = convo;
            
        }else if([contact.name isEqualToString:BEST_FRIEND]){
            
        }
    }
}

+(void)trailcontacts:(NSArray *)contacts
{
    for(Contacts *contact in contacts){
        if([contact.name isEqualToString:EXGF]){
            
        }else if([contact.name isEqualToString:BROTHER]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Drinking. Why? where are you?" andSelf:OTHER]];
            contact.conversation.conversation = convo;
        }else if([contact.name isEqualToString:FATHER]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"I can't call right now" andSelf:OTHER]];
            contact.conversation.conversation = convo;
        }else if([contact.name isEqualToString:BEST_FRIEND]){
            NSMutableArray *voicemails = [[NSMutableArray alloc] init];
            Voicemail *voicemail = [[Voicemail alloc] initWithDate:[NSDate date] andSoundFile:@"03 Touch" andFileType:@"mp3"];
            [voicemails addObject:voicemail];
            [voicemails addObjectsFromArray:contact.voicemails];
            contact.voicemails = voicemails;
        }
        
    }
}

+(void)lookoutcontacts:(NSArray *)contacts
{
    for(Contacts *contact in contacts){
        if([contact.name isEqualToString:EXGF]){
            NSMutableArray *voicemails = [[NSMutableArray alloc] init];
            Voicemail *voicemail = [[Voicemail alloc] initWithDate:[NSDate date] andSoundFile:@"04 With U" andFileType:@"mp3"];
            [voicemails addObject:voicemail];
            [voicemails addObjectsFromArray:contact.voicemails];
            contact.voicemails = voicemails;
        }else if([contact.name isEqualToString:BROTHER]){
            NSMutableArray *voicemails = [[NSMutableArray alloc] init];
            Voicemail *voicemail = [[Voicemail alloc] initWithDate:[NSDate date] andSoundFile:@"05 Feel Something" andFileType:@"mp3"];
            [voicemails addObject:voicemail];
            [voicemails addObjectsFromArray:contact.voicemails];
            contact.voicemails = voicemails;
        }else if([contact.name isEqualToString:FATHER]){
            
        }else if([contact.name isEqualToString:BEST_FRIEND]){
            NSMutableArray *convo = [[NSMutableArray alloc] initWithArray:contact.conversation.conversation];
            [convo addObject:[[Message alloc] initWithMessage:@"Yo" andSelf:SELF]];
            contact.conversation.conversation = convo;
        }
    }
}

+ (NSArray *)getContacts
{
    NSArray *contacts = [self contacts];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger location = [defaults integerForKey:@"location"];
    [self start:contacts];
    if(location > 1){
         [self lakecontacts:contacts];
        if(location > 2){
            [self trailcontacts:contacts];
            if(location > 3){
                [self lookoutcontacts:contacts];
            }
        }
    }
    return contacts;
}

@end