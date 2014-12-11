//
//  SpokenWord.m
//  Here
//
//  Created by Joshua J Coronado on 6/3/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "SpokenWord.h"
#import <AVFoundation/AVFoundation.h>
@implementation SpokenWord

#define START @"Chapter one. Here again?"
#define LAKE @"Chapter two. Things are things."
#define TRAIL @"Chapter three. God and other things."
#define OVERLOOK @"Chapter four. Here again."
+(NSArray *)getTexts
{
    return [NSArray arrayWithObjects:START , LAKE, TRAIL,OVERLOOK ,nil];
}
+(NSArray *)getSpeeches
{
    NSArray *texts = [self getTexts];
    NSMutableArray *speeches = [[NSMutableArray alloc] initWithCapacity:texts.count];
    for(NSString *text in texts){
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
        utterance.rate =  .1;
        utterance.pitchMultiplier =1;
        [speeches addObject:utterance];
    }
    
    return speeches;
}
@end
