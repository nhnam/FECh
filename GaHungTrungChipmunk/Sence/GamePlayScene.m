//
//  GamePlayScene.m
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "GamePlayScene.h"
#import "Egg.h"
#import "Macro.h"
#import "Constant.h"
#import "GCpShapeCache.h"

@interface GamePlayScene(){
}
-(void) addNewSpriteAtPosition:(CGPoint)pos;
-(void) initPhysics;
@end
enum {
	kTagParentNode = 1,
};
@implementation GamePlayScene

#define GRAVITY 700.0f
#define BALL_MASS 1.0f
#define MIN_R 6
#define MAX_R 32
#define STEP_INTERVAL 1/60.0f
#define ACCEL_INTERVAL 1/30.0f
#define FILTER_FACTOR 0.05f

#define BK_COLOR_KEY @"bk_color"

+(CCScene*)scene{
    CCScene* scene = [CCScene node];
    GamePlayScene* layer = [GamePlayScene node];
    [scene addChild:layer];
    return scene;
}
-(void)dealloc{
    // manually Free rogue shapes
	for( int i=0;i<4;i++) {
		cpShapeFree( _walls[i] );
	}
	cpSpaceFree( _space );
	[super dealloc];
}
-(id)init{
    if(self =[super init]){
        // enable events
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
        // init physics
		[self initPhysics];
		// Use batch node. Faster
		CCSpriteBatchNode *parent = [CCSpriteBatchNode batchNodeWithFile:@"eb.png" capacity:100];
		_spriteTexture = [parent texture];
        loadPlistTexture(@"eb.plist");
        [self addChild:parent z:0 tag:kTagParentNode];
        // load physics data
        [[GCpShapeCache sharedShapeCache] addShapesWithFile:@"egg.plist"];
		[self addNewSpriteAtPosition:ccp(200,200)];
		[self scheduleUpdate];
    }
    return self;
}

-(void) initPhysics
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	_space = cpSpaceNew();
	cpSpaceSetGravity( _space, cpv(0, -100) );
	//
	// rogue shapes
	// We have to free them manually
	//
	// bottom
	_walls[0] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(s.width,0), 0.0f);
	
	// top
	_walls[1] = cpSegmentShapeNew( _space->staticBody, cpv(0,s.height), cpv(s.width,s.height), 0.0f);
	
	// left
	_walls[2] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(0,s.height), 0.0f);
	
	// right
	_walls[3] = cpSegmentShapeNew( _space->staticBody, cpv(s.width,0), cpv(s.width,s.height), 0.0f);
	
	for( int i=0;i<4;i++) {
		cpShapeSetElasticity( _walls[i], 1.0f );
		cpShapeSetFriction( _walls[i], 1.0f );
		cpSpaceAddStaticShape(_space, _walls[i] );
	}
	
	_debugLayer = [CCPhysicsDebugNode debugNodeForCPSpace:_space];
	_debugLayer.visible = NO;
	[self addChild:_debugLayer z:100];
}

-(void) addNewSpriteAtPosition:(CGPoint)pos
{
    CCNode *parent = [self getChildByTag:kTagParentNode];
    // create and add sprite
	CCSprite *sprite = [CCSprite spriteWithFile:@"egg-1.png"];
	[parent addChild:sprite];
    // set anchor point
    sprite.anchorPoint = [[GCpShapeCache sharedShapeCache] anchorPointForShape:@"egg-1"];
    // create physics shape
    cpBody *body = [[GCpShapeCache sharedShapeCache] createBodyWithName:@"egg-1" inSpace:_space withData:sprite];
    // set position
    body->p = pos;
}


-(void) update:(ccTime) delta
{
	// Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
		
		[self addNewSpriteAtPosition: location];
	}
}






@end