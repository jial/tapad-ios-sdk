//
//  DemoAppAppDelegate.m
//  DemoApp
//
//  Created by Li Qiu on 9/14/11.
//  Copyright 2011 Tapad, Inc. All rights reserved.
//

#import "DemoAppAppDelegate.h"
#import "TapadEvent.h"
#import "TapadIdentifiers.h"

@implementation DemoAppAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    /*
     Add launch tracking logic here.
     */

    // Uncomment if supplied with an app id from Tapad.  If unspecified, the app id is set to the CFBundleName.
    [TapadEvent registerAppWithId:@"Tapad Tracking SDK (non-arc) Demo App"];

    // reset all Identifier config
    [self resetIdentifierConfig];
    
    // Prepare and send the launch tracking event.
    [TapadEvent applicationDidFinishLaunching:application];

    // tests (scheduled because the event sending is asynchronous but the config setting is synchronous
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(testEventWithNoIdentifier) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(testEventWithOpenUDID) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(testEventWithMD5HashedMAC) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(testEventWithSHA1HashedMAC) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(testEventWithMD5HashedUDID) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:12 target:self selector:@selector(testEventWithSHA1HashedUDID) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:14 target:self selector:@selector(testEventWithAllIdentifiers) userInfo:nil repeats:NO];
}

- (void) resetIdentifierConfig {
    // reset all Identifier config
    [TapadIdentifiers sendOpenUDID:NO];
    [TapadIdentifiers sendMD5HashedMAC:NO];
    [TapadIdentifiers sendSHA1HashedMAC:NO];
    [TapadIdentifiers sendMD5HashedUDID:NO];
    [TapadIdentifiers sendSHA1HashedUDID:NO];
}

- (void) testEventWithNoIdentifier {
    [self resetIdentifierConfig];
    
    // send test event with no identifiers specified
    [TapadEvent send:@"no identifiers enabled event"];
}

- (void) testEventWithOpenUDID {
    [self resetIdentifierConfig];
    
    // enable OpenUDID
    [TapadIdentifiers sendOpenUDID:YES];

    // send test event with OpenUDID enabled
    [TapadEvent send:@"OpenUDID specified"];
}

- (void) testEventWithMD5HashedMAC {
    [self resetIdentifierConfig];
    
    // enable MD5 Hashed MAC
    [TapadIdentifiers sendMD5HashedMAC:YES];

    // send test event with MD5 Hashed MAC enabled
    [TapadEvent send:@"MD5HashedMAC specified"];
}

- (void) testEventWithSHA1HashedMAC {
    [self resetIdentifierConfig];
    
    // enable SHA1 Hashed MAC
    [TapadIdentifiers sendSHA1HashedMAC:YES];

    // send test event with SHA1 Hashed MAC enabled
    [TapadEvent send:@"SHA1HashedMAC specified"];
}

- (void) testEventWithMD5HashedUDID {
    [self resetIdentifierConfig];
    
    // enable MD5 Hashed UDID
    [TapadIdentifiers sendMD5HashedUDID:YES];
    
    // send test event with MD5 Hashed UDID enabled
    [TapadEvent send:@"MD5HashedUDID specified"];
}

- (void) testEventWithSHA1HashedUDID {
    [self resetIdentifierConfig];
    
    // enable SHA1 Hashed UDID
    [TapadIdentifiers sendSHA1HashedUDID:YES];
    
    // send test event with SHA1 Hashed UDID enabled
    [TapadEvent send:@"SHA1HashedUDID specified"];
}

- (void) testEventWithAllIdentifiers {
    [self resetIdentifierConfig];

    // enable all identifiers
    [TapadIdentifiers sendOpenUDID:YES];
    [TapadIdentifiers sendMD5HashedMAC:YES];
    [TapadIdentifiers sendSHA1HashedMAC:YES];
    [TapadIdentifiers sendMD5HashedUDID:YES];
    [TapadIdentifiers sendSHA1HashedUDID:YES];
    
    // send test event with all identifiers enabled
    [TapadEvent send:@"all identifiers enabled"];
}

@end