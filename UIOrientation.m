//
//  OrientationListener.m
//  IttyBitty
//
//  Created by Denis Trofimov on 3/21/12.
//  Copyright (c) 2012 crygin. All rights reserved.
//

#import "UIOrientation.h"

@implementation UIOrientation

#pragma mark - Properties
@synthesize currentOrientation = _currentOrientation;

static UIOrientation *sharedInstance;

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

+ (UIOrientation *)sharedInstance {
    @synchronized(self) {
        if (!sharedInstance){
            sharedInstance = [[UIOrientation alloc] init];
            [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
            [[NSNotificationCenter defaultCenter] addObserver:sharedInstance 
                                                     selector:@selector(orientationChanged:) 
                                                         name:UIDeviceOrientationDidChangeNotification
                                                       object:nil];
        }
    }
    return sharedInstance;
}

- (void)orientationChanged:(NSNotification *)notification {
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationFaceDown:
            DLog(@"ORIENTATION IS FACE DOWN");
            break;
            
        case UIDeviceOrientationFaceUp:
            DLog(@"ORIENTATION IS FACE UP");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            DLog(@"ORIENTATION IS LANDSCAPE LEFT");
            _currentOrientation = [[UIDevice currentDevice] orientation];
            break;
        
        case UIDeviceOrientationLandscapeRight:
            DLog(@"ORIENTATION IS LANDSCAPE RIGHT");
            _currentOrientation = [[UIDevice currentDevice] orientation];
            break;
            
        case UIDeviceOrientationPortrait:
            DLog(@"ORIENTATION IS PORTRAIT");
            _currentOrientation = [[UIDevice currentDevice] orientation];
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            DLog(@"ORIENTATION IS PORTRAIT UPSIDE DOWN");
            _currentOrientation = [[UIDevice currentDevice] orientation];
            break;
            
        case UIDeviceOrientationUnknown:
            DLog(@"ORIENTATION IS UNKNOWN");
            break;
            
        default:
            break;
    }
}

+(id)alloc {
    @synchronized(self) {
        NSAssert(sharedInstance == nil, @"Attempted to allocate a second instance of a singleton OrientationListener.");
        sharedInstance = [super alloc];
    }
    return sharedInstance;
}

-(id) init {
    if (self = [super init]) {
        _currentOrientation = UIDeviceOrientationPortrait;
    }
    return self;
}

@end
