//
//  LevelModel.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArticleAnalysis.h"
#import "cocos2d.h"
#import "EnemyPathManager.h"

@interface LevelModel : NSObject
{
    @public
    int index;
};

-(id)init:(ArticleAnalysis*) article;
-(void)createNextEnemyGroup:(CCNode*) node :(NSMutableArray*) allAliveEnemyArray :(EnemyPathManager*) pathManager;
-(Boolean)isEnd;

@property (nonatomic,strong)NSMutableArray* AllEnemyGroup;
@property (nonatomic,assign)ArticleAnalysis* article;

@end
