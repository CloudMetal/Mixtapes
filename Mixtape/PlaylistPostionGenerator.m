//
//  PlaylistPostionGenerator.m
//  Mixtape
//
//  Created by orta therox on 26/11/2011.
//  Copyright (c) 2011 http://ortatherox.com. All rights reserved.
//

#import "PlaylistPostionGenerator.h"
#import "MixtapeAppDelegate.h"
#import "AlbumRef.h"

@implementation PlaylistPostionGenerator

+ (NSArray*)currentCenterPoints {
    // X - Y
    // 1 - (516 - 422)
    // 2 - (300 - 420) - ( 710 -420 )
    // 3 - (295 - 337 ) - 512/506 - 770 -336
    // 4 - 300/324  - 720/334
    // 5 - 250/259 - 765/259 - 508/431  - 250/618 - 759/618
    
    MixtapeAppDelegate * appDelegate = (MixtapeAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *points = nil;
    
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ){
        
        switch ([appDelegate.playlists count]) {
            case 1:
                points = [NSArray arrayWithObject: 
                          [[AlbumRef alloc] refWithX:526 y:422 andScale:1]];
                break;
                
            case 2:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:340 y:422 andScale:1],
                          [[AlbumRef alloc] refWithX:750 y:422 andScale:1]
                          , nil];
                break;
                
            case 3:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:542 y:506 andScale:0.9],
                          [[AlbumRef alloc] refWithX:295 y:337 andScale:0.9],
                          [[AlbumRef alloc] refWithX:830 y:337 andScale:0.9]
                          , nil];
                break;
                
            case 4:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:300 y:324 andScale:0.8],
                          [[AlbumRef alloc] refWithX:720 y:334 andScale:0.8],
                          [[AlbumRef alloc] refWithX:720 y:618 andScale:0.8],
                          [[AlbumRef alloc] refWithX:320 y:618 andScale:0.8]
                          , nil];
                break;
                
            case 5:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:250 y:259 andScale:0.7],
                          [[AlbumRef alloc] refWithX:765 y:259 andScale:0.7],
                          [[AlbumRef alloc] refWithX:508 y:431 andScale:0.7],
                          [[AlbumRef alloc] refWithX:250 y:618 andScale:0.7],
                          [[AlbumRef alloc] refWithX:759 y:618 andScale:0.7]
                          , nil];
                break;    
        }
    }
    
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ){
        switch ([appDelegate.playlists count]) {
            case 1:
                points = [NSArray arrayWithObject: 
                          [[AlbumRef alloc] refWithX:246 y:175 andScale:0.8]];
                break;
                
            case 2:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:159 y:175 andScale:0.6],
                          [[AlbumRef alloc] refWithX:351 y:175 andScale:0.6]
                          , nil];
                break;
                
            case 3:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:254 y:210 andScale:0.5],
                          [[AlbumRef alloc] refWithX:138 y:140 andScale:0.5],
                          [[AlbumRef alloc] refWithX:389 y:140 andScale:0.5]
                          , nil];
                break;
                
            case 4:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:140 y:135 andScale:0.4],
                          [[AlbumRef alloc] refWithX:337 y:139 andScale:0.4],
                          [[AlbumRef alloc] refWithX:337 y:257 andScale:0.4],
                          [[AlbumRef alloc] refWithX:150 y:257 andScale:0.4]
                          , nil];
                break;
                
            case 5:
                points = [NSArray arrayWithObjects: 
                          [[AlbumRef alloc] refWithX:117 y:107 andScale:0.4],
                          [[AlbumRef alloc] refWithX:358 y:107 andScale:0.4],
                          [[AlbumRef alloc] refWithX:238 y:179 andScale:0.4],
                          [[AlbumRef alloc] refWithX:117 y:257 andScale:0.4],
                          [[AlbumRef alloc] refWithX:355 y:257 andScale:0.4]
                          , nil];
                break;    
        }
    }
    return points;
}

@end
