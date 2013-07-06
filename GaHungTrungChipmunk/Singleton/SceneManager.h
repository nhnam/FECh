//
//  SenceManager.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SceneManager : NSObject

@property(nonatomic, readonly) SceneID currentSceneId;
@property(nonatomic, readonly) SceneID previousSceneId;
@property(nonatomic, retain) CCArray *arrScenes;
@property(nonatomic, retain) CCArray *historyScenes;

+(SceneManager*)getInstance;

-(void)replaceScene:(SceneID)scene;
-(void)popScene:(SceneID)scene;
-(void)pushScene:(SceneID)scene;
@end
