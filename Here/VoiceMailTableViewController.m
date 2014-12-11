//
//  VoiceMailTableViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/21/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "VoiceMailTableViewController.h"
#import "Voicemail.h"


@interface VoiceMailTableViewController ()
@property (strong, nonatomic) NSArray *voiceMails;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (nonatomic) NSInteger indexPlaying;
@end

@implementation VoiceMailTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _indexPlaying = -1;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _voiceMails= nil;
      _indexPlaying = -1;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _voiceMails = nil;
    _player = nil;
    _indexPlaying = -1;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    _player = nil;
    _voiceMails = nil;
    _indexPlaying = -1;
}
#pragma mark - Lazy Instantiation
- (NSArray *)voiceMails
{
    if (!_voiceMails)
    {
        _voiceMails = [Voicemail getVoicemails];
    }
    return _voiceMails;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == self.indexPlaying){
        self.player = nil;
        self.indexPlaying = -1;
    }else{
        Voicemail *voicemail = self.voiceMails[indexPath.row];
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:voicemail.soundFile error:&error];
        [self.player play];
        self.indexPlaying = indexPath.row;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.voiceMails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Voicemail" forIndexPath:indexPath];
    Voicemail *voicemail = self.voiceMails[indexPath.row];
    cell.textLabel.text = voicemail.contact.name;
    cell.detailTextLabel.text = voicemail.date;

    [cell.imageView setImage:voicemail.contact.image];
   
    return cell;
}
@end
