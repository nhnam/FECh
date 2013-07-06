//
//  SpriteManager.m
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "SpriteManager.h"
#import "GGChicken.h"
#import "GGEgg.h"
#import "GGNest.h"

@implementation SpriteManager
@synthesize currentSpriteAlloc;

-(void)dealloc{
    
    [super dealloc];
}
-(id)init{
    if(self= [super init]){
        currentSpriteAlloc = 0;
    }
    return self;
}
+(GGBaseSprite*)createNewSpriteWithId:(SpriteType)spriteId{
    switch (spriteId) {
        case SpriteChicken:
            return [[[GGChicken alloc] init] autorelease];
            break;
        case SpriteEgg:
            return [[[GGEgg alloc] init] autorelease];
            break;
        case SpriteNest:
            return [[[GGNest alloc] init] autorelease];
            break;
        default:
#warning Defaule Sprite does not supported
            break;
    }
}
@end
