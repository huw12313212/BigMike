//
//  EnemyManager.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyManager.h"
#import "Enemy.h"


@implementation EnemyManager

-(void)update:(ccTime)dt
{
    if([self isAllDead])
    {
        
    }
    
    CCLOG(@"test");
}

-(id)init : (CCNode*) parent
{
    if(self = [super init])
    {
     self.parentNode = parent;
    
    
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
