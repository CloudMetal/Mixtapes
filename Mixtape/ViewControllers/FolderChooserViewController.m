//
//  FolderChooserViewController.m
//  Mixtape
//
//  Created by orta therox on 18/11/2011.
//  Copyright (c) 2011 http://ortatherox.com. All rights reserved.
//

#import "FolderChooserViewController.h"

@interface FolderChooserViewController (private)
- (void)searchForFolders;
@end

@implementation FolderChooserViewController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    folders = [[NSMutableArray array] mutableCopy];
    
    // only show spotify button if they have spotify
    NSURL *url = [[NSURL alloc] initWithString: @"spotify://" ];
    spotifyButton.hidden = ![[UIApplication sharedApplication] canOpenURL:url];
    
    [self searchForFolders];
}

- (void)searchForFolders {
    if ([[[SPSession sharedSession] userPlaylists].playlists count] == 0) {
        [self performSelector:_cmd withObject:nil afterDelay:0.5];
        return;
    }
    
    NSLog(@"found playlist");
    for (id playlistOrFolder in [[SPSession sharedSession] userPlaylists].playlists) {
        if ([playlistOrFolder isKindOfClass:[SPPlaylistFolder class]]) {
            [folders addObject:playlistOrFolder];
        } 
    }
    [tableView reloadData];
}

- (IBAction)loadSpotify:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString: @"spotify:" ];
    [[UIApplication sharedApplication] openURL: url];   
}

#pragma mark table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 23.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [folders count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:ORCellReuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ORCellReuseID];
    }
    SPPlaylistFolder * folder = [folders objectAtIndex:indexPath.row];
    cell.textLabel.text = folder.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i playlists", [[folder playlists] count]];
    return cell;

}


#pragma mark table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SPPlaylistFolder * folder = [folders objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithUnsignedLongLong:folder.folderId] forKey:ORFolderID];
    [[NSNotificationCenter defaultCenter] postNotificationName: ORFolderChosen
                                                        object: nil];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
@end
