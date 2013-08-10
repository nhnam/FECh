#import "cocos2d.h"
@class HelloWorldLayer;

@interface Actor : CCNode 
{
    HelloWorldLayer *layer;
    CCSprite *sprite;
    NSMutableArray *pointArray;
    CGMutablePathRef path;
}
@property (nonatomic, retain) CCSprite *sprite;
@property (nonatomic, retain) NSMutableArray *pointArray;

-(id)initWith:(NSString *)image position:(CGPoint)pos maxGap:(float)gap layer:(CCLayer *)theLayer;
-(void)createPath;
@end
