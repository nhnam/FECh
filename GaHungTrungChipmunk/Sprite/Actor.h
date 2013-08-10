#import "cocos2d.h"
@class GamePlayScene;

@interface Actor : CCNode {
    GamePlayScene   *layer;
    CCSprite        *sprite;
    NSMutableArray  *pointArray;
    CGMutablePathRef path;
}
@property (nonatomic, retain) CCSprite *sprite;
@property (nonatomic, retain) NSMutableArray *pointArray;

-(id)initWith:(NSString *)image position:(CGPoint)pos maxGap:(float)gap layer:(CCLayer *)theLayer;
-(void)createPath;
@end
