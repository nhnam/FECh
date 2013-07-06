//
//  SpriteManager.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGBaseSprite.h"

@interface SpriteManager : NSObject
{
    int currentSpriteAlloc;
}
@property (readonly) int currentSpriteAlloc;

#pragma mark factory methods
+(GGBaseSprite*)createNewSpriteWithId:(SpriteType)spriteId;
@end
