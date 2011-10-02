//
//  TrackLayer.h
//  Mixtape
//
//  Created by orta therox on 30/09/2011.
//  Copyright 2011 http://ortatherox.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface TrackLayer : CATextLayer {
  int _monitorCount;
}

@property (retain, nonatomic) SPTrack * track;

- (id)initWithTrack:(SPTrack*)track;
- (void)monitorForLoaded;
- (void)turnToThumbnail;
@end
