//
//  BaseSprite.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "CCSprite.h"
#import "Constant.h"
#import "Actor.h"

@interface BaseSprite : CCSprite{
    SpriteType mSpriteType;
    float mMass;
    Actor   *actor;
}
@property(nonatomic, readwrite) SpriteType mSpriteType;
@property(nonatomic, readwrite) float mMass;
@property(nonatomic, retain) Actor *actor;
+(id)makeNewWithPosition:(CGPoint)point;
@end
