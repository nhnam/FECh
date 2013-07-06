//
//  BaseSprite.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

@interface GGBaseSprite : CCSprite{
    SpriteType mSpriteType;
    float mMass;
}
@property(nonatomic, readonly) SpriteType mSpriteType;
@property(nonatomic, readwrite) float mMass;
+(id)makeNewWithPosition:(CGPoint)point;
@end
