//
//  AnimationTestAppDelegate.m
//  AnimationTest
//
//  Created by holin on 11/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationTestAppDelegate.h"

@implementation AnimationTestAppDelegate

@synthesize window;
@synthesize currentView;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}


- (void)awakeFromNib
{
    NSView *contentView = [[self window] contentView];
    [contentView setWantsLayer:YES];
    [contentView addSubview:[self currentView]];
    
    transition = [CATransition animation];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromLeft];
    
    NSDictionary *ani = [NSDictionary dictionaryWithObject:transition forKey:@"subviews"];
    [contentView setAnimations:ani];
}

- (void)setCurrentView:(MSZLinkedView*)newView
{
    if (!currentView) {
        currentView = newView;
        return;
    }
    NSView *contentView = [[self window] contentView];
    [[contentView animator] replaceSubview:currentView with:newView];
    currentView = newView;
}

- (IBAction)nextView:(id)sender;
{
    if (![[self currentView] nextView]) return;
    [transition setSubtype:kCATransitionFromRight];
    [self setCurrentView:[[self currentView] nextView]];
}

- (IBAction)previousView:(id)sender;
{
    if (![[self currentView] previousView]) return;
    [transition setSubtype:kCATransitionFromLeft];
    [self setCurrentView:[[self currentView] previousView]];
}


@end
