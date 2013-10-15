//
//  EnemyGroup.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyPathManager.h"
#import "Enemy.h"
#import "Constants.h"

@interface EnemyGroup : NSObject

-(void)initEnemy : (CCNode*)targetNode :(NSMutableArray*) allAliveEnemy :(EnemyPathManager*) pathManager;

@end
