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

@interface EnemyManager : NSObject
{
    
}

@property (nonatomic,strong)NSMutableArray* nowAliveEnemies;
@property (nonatomic,assign)ArticleAnalysis* nowArticleAnaysis;
@property (nonatomic,assign)CCNode* parentNode;

-(id)init : (CCNode*) parent;

-(void)update:(ccTime)dt;
-(void)setCurrentArticle:(ArticleAnalysis*) analysis;
-(bool)isAllDead;

@end