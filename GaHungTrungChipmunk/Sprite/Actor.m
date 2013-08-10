#import "Actor.h"
#import "HelloWorldLayer.h"

@implementation Actor
@synthesize sprite, pointArray;

-(void) createPath {
    path=CGPathCreateMutable();
    CGPoint loc=[[pointArray objectAtIndex:0] CGPointValue];
    CGPathMoveToPoint(path, NULL, loc.x, loc.y);
    for (int i=1; i<[pointArray count]; i++) {
        CGPoint loc=[[pointArray objectAtIndex:i] CGPointValue];
        CGPathAddLineToPoint(path, NULL, loc.x, loc.y);
    }
    CGPathCloseSubpath(path);
    CGPathRetain(path);
}

-(void)doublePoints { 
    NSMutableArray *newPoints=[[NSMutableArray alloc] init];
    [pointArray addObject:[pointArray objectAtIndex:0]]; //for round robin
    for (int i=1; i<[pointArray count]; i++) {
        CGPoint loc2=[[pointArray objectAtIndex:i] CGPointValue];
        CGPoint loc1=[[pointArray objectAtIndex:i-1] CGPointValue];
        CGPoint mid=ccpMidpoint(loc1, loc2);
        [newPoints addObject:[pointArray objectAtIndex:i-1]];
        [newPoints addObject:[NSValue valueWithCGPoint:mid]];
        
    }
    self.pointArray=newPoints;
    [newPoints release];
}

-(float)maxDist {
    float max=0.0;
    [pointArray addObject:[pointArray objectAtIndex:0]]; //for round robin
    for (int i=1; i<[pointArray count]; i++) {
        CGPoint loc2=[[pointArray objectAtIndex:i] CGPointValue];
        CGPoint loc1=[[pointArray objectAtIndex:i-1] CGPointValue];
        float dist=ccpDistance(loc2, loc1);
        if (dist>max) max=dist;
    }
    [pointArray removeLastObject];
    return max;
}

-(void)fillGaps:(float)maxDistance { 
    float maxDist=[self maxDist];
    while (maxDist>maxDistance) {
        [self doublePoints];
        maxDist=[self maxDist];
    }
}


-(void)showPoints {
    for (int i=0; i<[pointArray count]; i++) {
        CCSprite *blob=[CCSprite spriteWithFile:@"blob.png"];
        CGPoint loc=[[pointArray objectAtIndex:i] CGPointValue];
        blob.position=loc;
        [sprite addChild:blob];
    }
}

-(void)addPoints {
    [self doesNotRecognizeSelector:_cmd];
}

-(id) initWith:(NSString *)image position:(CGPoint)pos maxGap:(float)gap layer:(HelloWorldLayer *)theLayer
{
	if( (self=[super init]) ) {
        [self addPoints];
        [self createPath];
        layer=theLayer;
        sprite=[CCSprite spriteWithFile:image];
        sprite.position=pos;
        sprite.opacity=168.0;
        [layer addChild:sprite];
        if (gap>0) { 
            [self fillGaps:gap];
            [self showPoints];
        }
	}
	return self;
}

- (void) dealloc
{
    CGPathRelease(path);
	[super dealloc];
}
@end
