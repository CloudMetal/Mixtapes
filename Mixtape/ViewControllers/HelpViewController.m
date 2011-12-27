//
//  HelpViewController.m
//  Mixtapes
//
//  Created by orta therox on 26/12/2011.
//  Copyright (c) 2011 http://ortatherox.com. All rights reserved.
//

#import "HelpViewController.h"
#import "ORButton.h"

@interface HelpViewController(privatE)
- (void)openURL:(NSString *)address;
@end

@implementation HelpViewController

@synthesize webView;
@synthesize loginHelpButton;
@synthesize foldersHelpButton;
@synthesize reccomendHelpButton;
@synthesize backHelpButton;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.backHelpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backHelpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.backHelpButton setCustomImage:@"bottombarredfire"];
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [self setBackHelpButton:nil];
    [super viewDidUnload];
}


- (IBAction)recommendHelp:(id)sender {
    [self openURL:@"http://ortastuff.s3.amazonaws.com/mixtape_help/sendsong.mov"];
}

- (IBAction)folderHelp:(id)sender {
    [self openURL:@"http://ortastuff.s3.amazonaws.com/mixtape_help/folder.mov"];
}

- (IBAction)loginHelp:(id)sender {
    [self openURL:@"http://ortastuff.s3.amazonaws.com/mixtape_help/login.mov"];
}

- (IBAction)close:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self openURL:@"http://google.com"];
    }];
}

- (void)openURL:(NSString *)address {
    NSURL *url = [NSURL URLWithString:address];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
