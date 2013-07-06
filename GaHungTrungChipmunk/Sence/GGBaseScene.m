//
//  GGBaseScene.m
//  GaHungTrungChipmunk
//
//  Created by Nam Nguyen on 7/6/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "GGBaseScene.h"

@implementation GGBaseScene

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GGBaseScene *layer = [GGBaseScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
@end
