//
//  HelloWorldLayer.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/3.
//  Copyright 王 瀚宇 2013年. All rights reserved.
//



#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "BulletManager.h"
#import "GroundWord.h"
#import "Player.h"
#import "EnemyManager.h"
#import "ArticleAnalysis.h"
//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    

}

@property (nonatomic,strong)BulletManager* bulletManager;
@property (nonatomic,strong)Player* player;
@property (nonatomic,strong)ArticleAnalysis* articleAnalysis;
@property (nonatomic,strong)EnemyManager* enemyManager;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;



@end
