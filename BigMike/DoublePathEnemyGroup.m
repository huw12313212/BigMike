//
//  DoublePathEnemyGroup.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "DoublePathEnemyGroup.h"

@implementation DoublePathEnemyGroup
-(id)init:(NSString*)target :(NSString*)target2
{
    if(self = [super init])
    {
        self.line1 = target;
        self.line2 = target2;
        
       // NSLog(@"hello1");
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)initEnemy : (CCNode*)targetNode :(NSMutableArray*) allAliveEnemy :(EnemyPathManager*) pathManager
{
     
    
    NSString* nextLine = self.line1;
    PathPair* pair = [pathManager RandomProducePairPath];
    
    int len = [nextLine length];
    for (int i = 0; i < len; i++) {
        
        
        NSString* character = [nextLine substringWithRange:NSMakeRange(i, 1)];
        Enemy* enemy = [[Enemy alloc]init :targetNode : character];
        [targetNode addChild:enemy.enemyLabel];
        enemy->time= -i*ENEMY_PADDING;
        enemy.path =pair.path1;
        
        enemy->hp = ENEMY_HP2;
        enemy->maxHP = ENEMY_HP2;
        
        [allAliveEnemy addObject:enemy];
    }
    
    
    nextLine = self.line2;
    len = [nextLine length];
    for (int i = 0; i < len; i++) {
        
        
        NSString* character = [nextLine substringWithRange:NSMakeRange(i, 1)];
        Enemy* enemy = [[Enemy alloc]init :targetNode : character];
        [targetNode addChild:enemy.enemyLabel];
        enemy->time= -i*ENEMY_PADDING;
        enemy.path =pair.path2;
        
        
        enemy->hp = ENEMY_HP2;
        enemy->maxHP = ENEMY_HP2;
        
        enemy->initColor = ENEMY_START_COLOR2;
        enemy->deadColor = ENEMY_DEAD_COLOR2;
        [enemy RecalculateColor];
        
        [allAliveEnemy addObject:enemy];
    }
    
}
@end
