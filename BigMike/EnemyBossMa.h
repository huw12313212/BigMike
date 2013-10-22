//
//  EnemyBossMa.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/18.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "Enemy.h"
#import "Player.h"
#import "DeathHandShake.h"



@interface EnemyBossMa : Enemy
{
    @public
    float MinimumDuration;
    float BulletTimeCounter;
    int BulletIndex;
    
    float DeathHandShakeCounter;
}

@property (strong,nonatomic)NSMutableArray* BulletArray;
@property (assign,nonatomic)Player* _player;
@property (strong,nonatomic)DeathHandShake* hand;
@property (strong,nonatomic)DeathHandShake* hand2;

@end

