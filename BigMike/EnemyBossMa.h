//
//  EnemyBossMa.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/18.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Enemy.h"
#import "Player.h"




@interface EnemyBossMa : Enemy
{
    @public
    float MinimumDuration;
    float BulletTimeCounter;
    int BulletIndex;
}

@property (strong,nonatomic)NSMutableArray* BulletArray;
@property (assign,nonatomic)Player* _player;

@end

