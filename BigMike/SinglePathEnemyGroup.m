//
//  SinglePathEnemyGroup.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "SinglePathEnemyGroup.h"

@implementation SinglePathEnemyGroup

-(id)init:(NSString*)target
{
    if(self = [super init])
    {
        self.line = target;
        
        
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)initEnemy : (CCNode*)targetNode :(NSMutableArray*) allAliveEnemy :(EnemyPathManager*) pathManager
{
    NSString* nextLine = self.line;
    EnemyPath* path = [pathManager RandomProducePath];
    
    int len = [nextLine length];
    for (int i = 0; i < len; i++) {
        

        NSString* character = [nextLine substringWithRange:NSMakeRange(i, 1)];
        Enemy* enemy = [[Enemy alloc]init :targetNode : character];
        [targetNode addChild:enemy.enemyLabel];
        enemy->time= -i*ENEMY_PADDING;
        enemy.path =path;
        
        [allAliveEnemy addObject:enemy];
    }
}
@end
