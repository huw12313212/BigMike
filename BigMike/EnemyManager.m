//
//  EnemyManager.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyManager.h"
#import "Enemy.h"
#import "Constants.h"


@implementation EnemyManager

-(void)update:(ccTime)dt
{
    if(![self.nowArticleAnaysis isEnd])
    {
        if([self isAllDead])
        {
            EnemyPath1* path = [[EnemyPath1 alloc]init];
            
            
            NSString* nextLine = [self.nowArticleAnaysis GetNextLine];
            
            int len = [nextLine length];
            for (int i = 0; i < len; i++) {
               
                
                NSString* character = [nextLine substringWithRange:NSMakeRange(i, 1)];
                Enemy* enemy = [[Enemy alloc]init :self.parentNode : character];
                [self.parentNode addChild:enemy.enemyLabel];
                enemy->time= -i*ENEMY_PADDING;
                enemy.path = path;
                
                [self.nowAliveEnemies addObject:enemy];
            }
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
