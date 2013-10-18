//
//  EnemyBossMaGroup.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/18.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyBossMaGroup.h"
#import "EnemyBossMa.h"

@implementation EnemyBossMaGroup

-(void)initEnemy : (CCNode*)targetNode :(NSMutableArray*) allAliveEnemy :(EnemyPathManager*) pathManager
{

    EnemyPath* path = [pathManager RandomProducePath];
    NSString* character = @"騜";
    Enemy* enemy = [[EnemyBossMa alloc]init :targetNode : character];
    [targetNode addChild:enemy.enemyLabel];
    enemy->time= 0;
    enemy.path =path;
    
    [allAliveEnemy addObject:enemy];

}

@end
