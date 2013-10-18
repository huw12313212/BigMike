//
//  Enemy.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"

@interface Enemy : NSObject
{
    @public
    float time;
    Boolean isAlive;
    NSInteger hp;
    NSInteger maxHP;
    ccColor3B initColor;
    ccColor3B deadColor;
    
    
}

-(id)init : (CCNode*) parent :(NSString*) str;
-(void)update:(ccTime)dt;
-(void)BulletHit;
-(void)RecalculateColor;
@property (nonatomic,strong) EnemyPath* path;
@property (nonatomic,assign)CCNode* parentNode;
@property (nonatomic, strong)CCLabelTTF* enemyLabel;



@end
