//
//  EnemyBossMa.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/18.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyBossMa.h"

@implementation EnemyBossMa


-(id)init : (CCNode*) parent :(NSString*) str
{
    if(self = [super init])
    {
        isAlive = true;
        time = 0;
        hp = ENEMY_HP;
        maxHP =ENEMY_HP;
        
        initColor = BOSS_MA_COLOR;
        deadColor = BOSS_MA_COLOR;
        
        self.parentNode = parent;
        self.enemyLabel = [CCLabelTTF labelWithString: str fontName:DEFAULT_FONT fontSize:BOSS_MA_SIZE];
        
  
        [self RecalculateColor];
        
        
        return self;
    }
    else
    {
        return nil;
    }
}
    

-(void)BulletHit
{
    if (NO) {
        [super BulletHit];
    }
    

}


@end
