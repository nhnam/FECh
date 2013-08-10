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
    ChipmunkSpace *space;
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
enum {
	kTagBatchNode = 1,
};

static void eachBody(cpBody *body, void *data)
{
	CCSprite *sprite = body->data;
	if( sprite )
    {
		[sprite setPosition: body->p];
		[sprite setRotation: (float) CC_RADIANS_TO_DEGREES( -body->a )];
	}
}

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
        bgColorLayer = [CCLayerColor layerWithColor:ccc4(57, 109, 58, 255)];
        [self addChild:bgColorLayer z:0];
        [self setBGColor:ccWHITE];
		// Use batch node. Faster
		CCSpriteBatchNode *parent = [CCSpriteBatchNode batchNodeWithFile:@"eb.png" capacity:100];
		_spriteTexture = [parent texture];
        loadPlistTexture(@"eb.plist");
        [self addChild:parent z:0 tag:kTagParentNode];
        // load physics data
        [[GCpShapeCache sharedShapeCache] addShapesWithFile:@"egg.plist"];
        _arrEggs =  cArr();
		[self addNewSpriteAtPosition:ccp(200,200)];
		[self scheduleUpdate];
    }
    return self;
}
-(void) addChipmunkSpace{

}
-(void) initPhysics
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	_space = cpSpaceNew();
	cpSpaceSetGravity( _space, cpv(0, -980) );
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

- (void) setBGColor: (ccColor3B) color{    
    [bgColorLayer setColor:color];
}

-(void) addNewSpriteAtPosition:(CGPoint)pos
{
    //row 1, col 1
    int num = 33;
    CGPoint verts[] = {
        cpv(-4.5f, -37.0f),
        cpv(-11.5f, -35.0f),
        cpv(-13.5f, -34.0f),
        cpv(-16.5f, -32.0f),
        cpv(-22.5f, -26.0f),
        cpv(-25.5f, -20.0f),
        cpv(-27.5f, -14.0f),
        cpv(-28.5f, -6.0f),
        cpv(-28.5f, -3.0f),
        cpv(-27.5f, 4.0f),
        cpv(-24.5f, 14.0f),
        cpv(-21.5f, 20.0f),
        cpv(-17.5f, 26.0f),
        cpv(-11.5f, 32.0f),
        cpv(-8.5f, 34.0f),
        cpv(-6.5f, 35.0f),
        cpv(-3.5f, 36.0f),
        cpv(3.5f, 36.0f),
        cpv(6.5f, 35.0f),
        cpv(9.5f, 33.0f),
        cpv(16.5f, 26.0f),
        cpv(20.5f, 20.0f),
        cpv(24.5f, 11.0f),
        cpv(25.5f, 8.0f),
        cpv(26.5f, 3.0f),
        cpv(26.5f, -12.0f),
        cpv(24.5f, -19.0f),
        cpv(21.5f, -25.0f),
        cpv(19.5f, -28.0f),
        cpv(16.5f, -31.0f),
        cpv(12.5f, -34.0f),
        cpv(10.5f, -35.0f),
        cpv(3.5f, -37.0f)
    };
    
    // fix retina
    for(int i=0;i<num;i++){
        verts[i].x = verts[i].x/2;
        verts[i].y = verts[i].y/2;
    }
    cpBody *body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, verts, CGPointZero));
	cpBodySetPos( body, pos );
	cpSpaceAddBody(_space, body);
	
	cpShape* shape = cpPolyShapeNew(body, num, verts, CGPointZero);
	cpShapeSetElasticity( shape, 0.2f );
	cpShapeSetFriction( shape, 0.5f );
	cpSpaceAddShape(_space, shape);
    
	// sprite
	CCPhysicsSprite *sprite = [CCPhysicsSprite spriteWithFile:strF(@"egg-%d.png",rand()%4+1)];
	[self addChild: sprite];
	[sprite setCPBody:body];
	[sprite setPosition: pos];
    [_arrEggs addObject:sprite];
}


-(void) update:(ccTime) delta
{
	int steps = 2;
	CGFloat dt = delta/(CGFloat)steps;
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
//    cpSpaceEachBody(_space, &eachBody, nil);
//    CGSize s = [[CCDirector sharedDirector] winSize];
//    for (CCSprite *egg in _arrEggs){
//        if (!egg.visible) continue;
//        if (CGRectIntersectsRect(CGRectApplyAffineTransform(CGRectMake(0, 0, s.width, s.height), [self nodeToParentTransform]), egg.boundingBox)) {
//            egg.visible = NO;
//        }
//        
//    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
		[self addNewSpriteAtPosition: location];
	}
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
	static float prevX=0, prevY=0;
	
#define kFilterFactor 0.05f
	
//	float accelX = (float) acceleration.x * kFilterFactor + (1- kFilterFactor)*prevX;
//	float accelY = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevY;

    float accelX = (float) acceleration.x * 2;
	float accelY = (float) acceleration.y * 2;
	prevX = accelX;
	prevY = accelY;
    
//    CCLOG(@"%2.1f, %2.1f", accelX, accelY);
	
	cpVect v;
		v = cpv( accelX, accelY);
	
	cpSpaceSetGravity( _space, cpvmult(v, 980) );
}

@end