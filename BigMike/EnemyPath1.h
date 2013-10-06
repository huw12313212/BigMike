//
//  EnemyPath1.h
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath.h"

@interface EnemyPath1 : EnemyPath{
    
    CGPoint P0, P1, P2, P3;
}
-(id)init;
-(CGPoint) GetPosition:(float)nowTime;

@end
