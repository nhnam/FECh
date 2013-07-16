//
//  GamePlayScene.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "chipmunk.h"
#import "cocos2d.h"

@interface GamePlayScene : CCLayer
{
@private
	CCTexture2D *_spriteTexture; // weak ref
	CCPhysicsDebugNode *_debugLayer; // weak ref
	cpSpace *_space; // strong ref
	cpShape *_walls[4];
}

+(CCScene*)scene;
@end
