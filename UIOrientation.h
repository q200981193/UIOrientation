//
//  OrientationListener.h
//  IttyBitty
//
//  Created by Denis Trofimov on 3/21/12.
//  Copyright (c) 2012 crygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIOrientation : NSObject

+ (UIOrientation *) sharedInstance;

@property(readonly) NSInteger currentOrientation;

@end
