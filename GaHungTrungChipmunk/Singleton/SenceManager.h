//
//  SenceManager.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SenceManager : NSObject

@property(nonatomic, readonly) SceneID currentSceneId;
@property(nonatomic, readonly) SceneID previousSceneId;
@property(nonatomic, retain) CCArray *arrSence;

-(void)nextScene;
-(void)prevScene;
@end
