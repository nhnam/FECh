//
//  Egg.h
//  GaHungTrung
//
//  Created by Nam Nguyen on 6/9/13.
//  Copyright (c) 2013 namnguyen. All rights reserved.
//

#import "CCSprite.h"
#import "BaseSprite.h"
#define frEgg1 @"egg_level_01"
#define frEgg2 @"egg_level_02"
#define frEgg3 @"egg_level_03"
#define frEgg4 @"egg_level_04"
#define frEgg5 @"egg_level_05"
#define frEgg6 @"egg_level_06"
#define frEgg7 @"egg_level_07"
#define frEgg8 @"egg_level_08"
#define frEgg9 @"egg_level_09"
#define frEgg10 @"egg_level_10"
#define frEgg11 @"egg_level_11"
#define frEgg12 @"egg_level_12"
#define frEgg13 @"egg_level_13"
#define frEgg14 @"egg_level_14"
#define frEgg15 @"egg_level_15"
#define frEgg16 @"egg_level_16"
#define frEgg17 @"egg_level_17"
#define frEgg18 @"egg_level_18"
#define frEgg19 @"egg_level_19"
#define frEgg20 @"egg_level_20"
#define frEgg21 @"egg_level_21"
#define frEgg22 @"egg_level_22"
#define frEgg23 @"egg_level_23"
#define frEgg24 @"egg_level_24"
#define frEgg25 @"egg_level_25"
typedef enum {
    EGG_1,
    EGG_2,
    EGG_3,
    EGG_4,
    EGG_5,
    EGG_6,
    EGG_7,
    EGG_8,
    EGG_9,
    EGG_10,
    EGG_11,
    EGG_12,
    EGG_13,
    EGG_14,
    EGG_15,
    EGG_16,
    EGG_17,
    EGG_18,
    EGG_19,
    EGG_20,
    EGG_21,
    EGG_22,
    EGG_23,
    EGG_24,
    EGG_25
}EGG;

@interface Egg : BaseSprite
+(Egg*)getEggWithType:(EGG)type;
@end
