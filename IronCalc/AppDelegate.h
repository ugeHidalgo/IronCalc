//
//  AppDelegate.h
//  IronCalc
//
//  Created by Hidalgo Hernandez Eugenio on 12/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *swimDistance;
@property (weak) IBOutlet NSTextField *bikeDistance;
@property (weak) IBOutlet NSTextField *runDistance;
@property (weak) IBOutlet NSTextField *swimTime;
@property (weak) IBOutlet NSTextField *t1Time;
@property (weak) IBOutlet NSTextField *bikeTime;
@property (weak) IBOutlet NSTextField *t2Time;
@property (weak) IBOutlet NSTextField *runTime;
@property (weak) IBOutlet NSTextField *totalTime;
@property (weak) IBOutlet NSTextField *speedTimeSwim;
@property (weak) IBOutlet NSTextField *speedDistanceSwim;
@property (weak) IBOutlet NSTextField *speedBike;
@property (weak) IBOutlet NSTextField *speedRun;
@property (weak) IBOutlet NSTextField *rithmRun;


- (IBAction)calculateSwimTime:(id)sender;
- (IBAction)calculateBikeTime:(id)sender;
- (IBAction)calculateRunTime:(id)sender;
- (IBAction)calculateTotalTime:(id)sender;




@end
