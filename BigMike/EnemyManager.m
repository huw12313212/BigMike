//
//  EnemyManager.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyManager.h"
#import "Enemy.h"
#import "EnemyPath.h"
#import "Constants.h"
#import "EnemyPathManager.h"

@implementation EnemyManager

-(void)update:(ccTime)dt
{
    [self EnemyLogic : dt];
    [self CheckEnemyHitPlayer:dt];

    
    
}

-(void)CheckEnemyHitPlayer:(ccTime)dt
{
    CGRect playerRect = self.player.playerLabel.boundingBox;
    
    for(Enemy* enemy in self.nowAliveEnemies)
    {
        CGRect enemyRect = enemy.enemyLabel.boundingBox;
        
        if(CGRectIntersectsRect(playerRect, enemyRect))
        {
            [self.player hitByEnemy:enemy];
        }
    }
}

-(void)EnemyLogic:(ccTime)dt
{
    if([self isAllDead])
    {
        
        if(![self.levelModel isEnd])
        {
            
            [self.levelModel createNextEnemyGroup:self.parentNode :self.nowAliveEnemies :self.enemyPathManager];
        }
    }
    
    for(Enemy* enemy in self.nowAliveEnemies)
    {
        [enemy update:dt];
        
        if(!enemy->isAlive)
        {
            [self.trashEnemies addObject:enemy];
        }
    }
    
    for(Enemy* enemy in self.trashEnemies)
    {
        [self.nowAliveEnemies removeObject:enemy];
        [self.parentNode removeChild:enemy.enemyLabel];
    }
    
    [self.trashEnemies removeAllObjects];
}

-(id)init : (CCNode*) parent
{
    if(self = [super init])
    {
     self.parentNode = parent;
     self.nowAliveEnemies = [[NSMutableArray alloc]init];
     self.trashEnemies =[[NSMutableArray alloc]init];
     self.enemyPathManager = [[EnemyPathManager alloc]init];
        
     return self;
    }
    else
    {
      return nil;
    }
}

-(void)setCurrentArticle:(ArticleAnalysis*) analysis
{
    self.nowArticleAnaysis = analysis;
    
    self.levelModel = [[LevelModel alloc]init:analysis];
    
}

-(bool)isAllDead
{
    if(self.nowAliveEnemies == nil)CCLOG(@"null enemy pointer");
    
    if([self.nowAliveEnemies count]==0)
    {
       return true;
    }
    else
    {
        return false;
    }
}

@end
