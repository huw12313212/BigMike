//
//  LevelModel.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "LevelModel.h"
#import "SinglePathEnemyGroup.h"
#import "DoublePathEnemyGroup.h"


@implementation LevelModel


-(id)init:(ArticleAnalysis*) article
{
    if(self = [super init])
    {
        index = 0;
        self.AllEnemyGroup = [[NSMutableArray alloc]init];
        self.article = article;
        
        [self createLevel];
 
        
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)createLevel
{
    while(![self.article isEnd])
    {
        NSString* nextLine = [self.article GetNextLine];
        
        int random = rand()%3;
        
        if(![self.article isEnd]&&random==0)
        {
             NSString* nextLine2 = [self.article GetNextLine];
            [self.AllEnemyGroup addObject: [[DoublePathEnemyGroup alloc]init:nextLine :nextLine2]];
        }
        else
        {
            [self.AllEnemyGroup addObject: [[SinglePathEnemyGroup alloc]init:nextLine]];
        }
        
        
    }
}


-(void)createNextEnemyGroup:(CCNode*) node :(NSMutableArray*) allAliveEnemyArray :(EnemyPathManager*) pathManager
{
   // NSLog(@"test1111");
    [self.AllEnemyGroup[index] initEnemy:node :allAliveEnemyArray :pathManager];
    
    index ++;
}

-(Boolean)isEnd
{
    return index >= [self.AllEnemyGroup count];
}





@end
