//
//  EnemyManager.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ArticleAnalysis.h"
#import "EnemyPathManager.h"
#import "LevelModel.h"
#import "Player.h"

@interface EnemyManager : NSObject
{
    
}

@property (nonatomic,strong)NSMutableArray* nowAliveEnemies;
@property (nonatomic,strong)NSMutableArray* trashEnemies;

@property (nonatomic,assign)ArticleAnalysis* nowArticleAnaysis;
@property (nonatomic,assign)CCNode* parentNode;
@property (nonatomic,strong)EnemyPathManager* enemyPathManager;
@property (nonatomic,strong)LevelModel* levelModel;
@property (nonatomic,assign)Player* player;



-(id)init : (CCNode*) parent;

-(void)update:(ccTime)dt;
-(void)setCurrentArticle:(ArticleAnalysis*) analysis;
-(bool)isAllDead;

@end
