//
//  SpriteManager.m
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "SpriteManager.h"
#import "Chicken.h"
#import "Egg.h"
#import "Nest.h"

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
+(BaseSprite*)createNewSpriteWithId:(SpriteType)spriteId{
    switch (spriteId) {
        case SpriteChicken:
            return [[[Chicken alloc] init] autorelease];
            break;
        case SpriteEgg:
            return [[[Egg alloc] init] autorelease];
            break;
        case SpriteNest:
            return [[[Nest alloc] init] autorelease];
            break;
        default:
#warning Defaule Sprite does not supported
            break;
    }
}
@end
