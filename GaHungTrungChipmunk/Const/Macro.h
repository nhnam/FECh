//
//  Macro.h
//  NN
//
//  Created by Nam Nguyen on 3/31/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//


#ifndef NN_Macro_h
#define NN_Macro_h


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define SCREEN_WIDTH [[CCDirector sharedDirector] winSize].width
#define SCREEN_HEIGHT [[CCDirector sharedDirector] winSize].height
#define deltaX  (SCREEN_WIDTH - 480)/2.0
#define hOSp(s) s.boundingBox.size.height
#define DLog(...) NSLog(@"%s(line %d) %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#define FLog(n) DLog(@"%2.1f",n)
#define BLog(b) DLog(@"%@",b?@"YES":@"NO")
#if 0
#define fstart() NSLog(@"%s(line %d) START ", __PRETTY_FUNCTION__, __LINE__)
#define fstop() NSLog(@"%s(line %d) FINISH ", __PRETTY_FUNCTION__, __LINE__)
#else
#define fstart()
#define fstop()
#endif

#define strF(...) [NSString stringWithFormat:__VA_ARGS__]
#define makeLinkHtml(s) strF(@"<a href=\"%@\">%@</a>",s,s)


#define Frame(s,v) DLog(@"%@:%@",s,NSStringFromCGRect(v));
#define Point(s,v) DLog(@"%@:%@",s,NSStringFromCGPoint(v));
#define SetH4Frame(f,h) f.size.height = h
#define SetW4Frame(f,w) f.size.height = w
#define SetFrame4View(v,f) v.frame = f;
#define SetX4View(v,x) {\
\
\
}
#define xOfFrame(a) a.origin.x
#define yOfFrame(a) a.origin.y
#define wOfFrame(a) a.size.width
#define hOfFrame(a) a.size.height

#define xOfView(a) a.frame.origin.x
#define yOfView(a) a.frame.origin.y
#define wOfView(a) a.frame.size.width
#define hOfView(a) a.frame.size.height

#define OutCmd(r) DLog(@"%s,%@",__PRETTY_FUNCTION__,r)
#define FrameNew(x,y,w,h) CGRectMake(x, y, w, h)
#define FrameWithMargin(f,d) CGRectMake(f.origin.x + d, f.origin.y + d, f.size.width - 2*d, f.size.height - 2*d)
#define moveViewX(v,a){\
CGRect frame = v.frame;\
frame.origin.x += a;\
v.frame = frame;\
}
#define moveViewY(v,y){\
CGRect frame = v.frame;\
frame.origin.y += y;\
v.frame = frame;\
}
#define CenterOfFrame(f) CGPointMake((f.origin.x + (f.size.width / 2)), (f.origin.y + (f.size.height / 2)))
#define MakeRounded(v,r) v.layer.cornerRadius = r;v.layer.masksToBounds = YES;



#define NewColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define ClearColor  [UIColor clearColor]
#define PurColor    [UIColor purpleColor]

#define MakeShadow(v,r) v.layer.shadowColor = [NewColor(126,126,126) CGColor];\
v.layer.shadowOpacity = 1.0;\
v.layer.shadowRadius = 0.5;\
v.layer.shadowOffset = CGSizeMake(0, r);\
v.layer.shadowPath = [UIBezierPath bezierPathWithRect:v.bounds].CGPath;

#define getSetting(k) [[NSUserDefaults standardUserDefaults] objectForKey:k]
#define saveSetting(s,k) [[NSUserDefaults standardUserDefaults] setValue:s forKey:k];
#define loadImg(s)  [UIImage imageNamed:s]

#define loadNib(v)  [[[NSBundle mainBundle] loadNibNamed:v owner:nil options:nil] objectAtIndex:0]
#define newArr()    [[NSMutableArray alloc] init]
#define pushCtrl(c)     [self.navigationController pushViewController:c animated:YES]
#define hideNavBar()    [self.navigationController setNavigationBarHidden:YES]
#define showNavBar()    [self.navigationController setNavigationBarHidden:NO]
#define obAtI(a,i)      [a objectAtIndex:i]

#define alertDialog(t, m) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:t\
message:m\
delegate:nil\
cancelButtonTitle:@"OK"\
otherButtonTitles:nil];\
[alert show];

#define info(t, m) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:t\
message:m\
delegate:nil\
cancelButtonTitle:@"OK"\
otherButtonTitles:nil];\
[alert show];


#define URL(v) [NSURL URLWithString:v]
#define isClass(a,v) [a isKindOfClass:[v class]]
#define MakeHtml(text,size) [NSString stringWithFormat:@"<html> \n"\
"<head> \n"\
"<style type=\"text/css\"> \n"\
"body {font-family: helvetica;font-size: %@;color: #696969;}\n"\
"</style> \n"\
"</head> \n"\
"<body>%@</body> \n"\
"</html>",[NSNumber numberWithInt:size], text]
#define MakeHtmlBlack(text,size) [NSString stringWithFormat:@"<html> \n"\
"<head> \n"\
"<style type=\"text/css\"> \n"\
"body {font-name: Helvetica;font-size: %@;color: black;background-color:#000000;}\n"\
"</style> \n"\
"</head> \n"\
"<body> %@ </body> \n"\
"</html>",[NSNumber numberWithInt:size], text]

#define isCollided(s1,s2,dt) \
                (   s2.pos_x > (s1.position.x - s1.contentSize.width / 2 - 10) &&\
                    s2.pos_x < (s1.position.x + s1.contentSize.width / 2 + 10) &&\
                    s2.pos_y < (s1.position.y + (s2.contentSize.height + s1.contentSize.height) / 2) &&\
                    s2.pos_y > ((s1.position.y + (s2.contentSize.height + s1.contentSize.height) / 2) + s2.vel_y * dt - 100 * dt)\
                )

#define newAr [[NSMutableArray alloc] init]
#define newDi [[NSMutableDictionary alloc] init]
#define cArr() [[CCArray alloc] init]
#define sprite(s) [CCSprite spriteWithFile:s]
#define spriteFrame(s) [CCSprite spriteWithSpriteFrameName:s]
#define layerCenter() ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2)
#define frameCached(s) [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:s]
#define loadPlistTexture(s) [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:s]
#define clearPlistTexture(s) [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFramesFromFile:s];
#define addBatchNode(s) [self addChild:[CCSpriteBatchNode batchNodeWithFile:s capacity:100] z:0];
#define clearBatchNode(s) [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFrameByName:s];

#endif

