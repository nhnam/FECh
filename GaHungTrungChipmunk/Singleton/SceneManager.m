//
//  SenceManager.m
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "SceneManager.h"
#import "GGGameOverScene.h"
#import "GGGamePlayScene.h"
#import "GGIntroScene.h"
#import "GGMenuScene.h"

@interface SceneManager (Private)

@end


@implementation SceneManager
#pragma mark shared instanced
static SceneManager *instance = nil;
static GGMenuScene *menuInstace = nil;
static GGIntroScene *introInstace = nil;
static GGGameOverScene *gameoverInstace = nil;
static GGGamePlayScene *gameplayInstance = nil;


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
-(GGBaseScene*)sceneWithID:(SceneID)sceneId{
    switch (sceneId) {
        case SceneMenu:
        {
            
        }
            break;
        case SceneIntro:
        {
            
        }
            break;
        case SceneGamePlay:
        {
            
        }
            break;
        case SceneGameOver:
        {
            
        }
            break;
            
        default:
            break;
    }
}
#pragma mark PUCLIC METHODS
+(SceneManager*)getInstance{
    @synchronized(self){
        if(instance==nil){
            instance = [[SceneManager alloc] init];
        }
        return instance;
    }
}
+(GGBaseScene*)getInstance:(SceneID)sceneId{
    switch (sceneId) {
        case SceneIntro:
            @synchronized(self){
                if(introInstace == nil){
                    introInstace = [[GGIntroScene alloc] init];
                }
                return introInstace;
            }
            break;
        case SceneGamePlay:
            @synchronized(self){
                if(gameplayInstance == nil){
                    gameplayInstance = [[GGGamePlayScene alloc] init];
                }
                return gameplayInstance;
            }
            break;
        case SceneMenu:
            @synchronized(self){
                if(menuInstace == nil){
                    menuInstace = [[GGMenuScene alloc] init];
                }
                return menuInstace;
            }
            break;
        case SceneGameOver:
            @synchronized(self){
                if(gameoverInstace == nil){
                    gameoverInstace = [[GGGameOverScene alloc] init];
                }
                return gameoverInstace;
            }
            break;
            break;
            
        default:
            break;
    }
}

-(void)replaceScene:(SceneID)scene{

}
-(GGBaseScene*)popScene:(SceneID)scene{
    GGBaseScene *lastScene = [arrScenes lastObject];
    [arrScenes removeLastObject];
    return lastScene;
}
-(void)pushScene:(SceneID)scene{
//    arrScenes addObject:Scee
}


@end
