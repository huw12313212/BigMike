//
//  Constants.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#ifndef BigMike_Constants_h
#define BigMike_Constants_h


#define DEFAULT_FONT @"Marker Felt"

#define SCREEN_WIDTH 480
#define SCREEN_HEIGHT 320

#define BULLET_SIZE 16
#define BULLET_WORD @"彈"
#define BULLET_GRAY_WORD @"火"
#define BULLET_OUTSIDE_PADDING 30
#define BULLET_MAX_COUNT 30
#define BULLET_FREQUENCY 8
#define BULLET_SPEED 8
#define BULLET_COLOR ccc3(200,255,200)
#define BULLET_OFFSET ccp(10,0)
#define BULLET_GRAY_COLOR ccc3(201,76,18)


#define PLAYER_WORD @"艦"
#define PLAYER_SIZE 32
#define PLAYER_COLOR ccc3(129,171,240)
#define PLAYER_POSITION ccp(40,160)
#define PLAYER_HP 3
#define PLAYER_BLINK_FREQUENCY 10
#define PLAYER_BLINK_COLOR ccc3(29,71,40)
#define PLAYER_BLINK_DURATION 1

#define GROUND_WORD1 @"街"
#define GROUND_WORD2 @"村"
#define GROUND_WORD3 @"都"
#define GROUND_COLOR1 ccc3(100,100,100)
#define GROUND_COLOR2 ccc3(100,150,100)
#define GROUND_COLOR3 ccc3(100,100,100)
#define GROUND_SIZE_MORE_BIGGEST 60
#define GROUND_SIZE_BIGGEST 50
#define GROUND_SIZE_BIG 40
#define GROUND_SIZE_NORMAL 30
#define GROUND_SIZE_SMALL 20
#define GROUND_SIZE_SMALLEST 18

#define ENEMY_PADDING 0.4f
#define ENEMY_SIZE 32
#define ENEMY_START_COLOR ccc3(255,0,255)
#define ENEMY_DEAD_COLOR ccc3(255,0,0)
#define ENEMY_HP 4
#define ENEMY_HIT_SCALE 1.3
#define ENEMY_PRE_DURATION 0.05
#define ENEMY_POST_DURATION 0.05


#define ENEMY_START_COLOR2 ccc3(0,150,150)
#define ENEMY_DEAD_COLOR2 ccc3(255,0,0)
#define ENEMY_HP2 4

#define BOSS_MA_SIZE 97
#define BOSS_MA_COLOR ccc3(254,247,188)
#define BOSS_MA_BULLET_STRING @"謝謝指教"
#define BOSS_MA_BULLET_NUMBER 4
#define BOSS_MA_BULLET_FREQUENCY 8
#define BOSS_MA_BULLET_SPEED 320
#define BOSS_MA_BULLET_COLOR  ccc3(255,200,200)

#endif
