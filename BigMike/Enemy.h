//
//  Enemy.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"
#import <Foundation/Foundation.h>

@interface Enemy : NSObject
{
    @public
    float time;
    Boolean isAlive;
    NSInteger hp;
    
}

-(id)init : (CCNode*) parent :(NSString*) str;
-(void)update:(ccTime)dt;
-(void)BulletHit;
@property (nonatomic,strong) EnemyPath* path;
@property (nonatomic,assign)CCNode* parentNode;
@property (nonatomic, strong)CCLabelTTF* enemyLabel;


@end
