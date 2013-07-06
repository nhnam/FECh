//
//  SenceManager.m
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "SceneManager.h"

@interface SceneManager (Private)

@end

static SceneManager *instance = nil;
@implementation SceneManager

#pragma mark SYNTHERSIZE
@synthesize arrScenes;
@synthesize historyScenes;
@synthesize currentSceneId;
@synthesize previousSceneId;

#pragma mark DESTRUCTION METHODS
-(void)dealloc{
    if(arrScenes){
        [arrScenes removeAllObjects];
        [arrScenes release];
    }
    if(historyScenes){
        [historyScenes removeAllObjects];
        [historyScenes release];
    }
    [super dealloc];
}
#pragma mark INITIALIZATIONS METHODS
-(id)init{
    if(self=[super init]){
        arrScenes =  cArr();
        historyScenes = cArr();
    }
    return self;
}
#pragma mark PRIVATE METHODS

#pragma mark PUCLIC METHODS
+(SceneManager*)getInstance{
    @synchronized(self){
        if(instance==nil){
            instance = [[SceneManager alloc] init];
        }
        return instance;
    }
}

-(void)replaceScene:(SceneID)scene{

}
-(void)popScene:(SceneID)scene{
    
}
-(void)pushScene:(SceneID)scene{
    
}

@end
