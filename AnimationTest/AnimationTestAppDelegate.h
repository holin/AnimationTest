//
//  AnimationTestAppDelegate.h
//  AnimationTest
//
//  Created by holin on 11/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/CoreAnimation.h>
#import "MSZLinkedView.h"

@interface AnimationTestAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    IBOutlet MSZLinkedView *currentView;
    
    CATransition *transition;
}

@property (assign) IBOutlet NSWindow *window;

@property(retain)MSZLinkedView *currentView;

- (IBAction)nextView:(id)sender;
- (IBAction)previousView:(id)sender;


@end
