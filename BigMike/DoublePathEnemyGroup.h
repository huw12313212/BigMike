//
//  DoublePathEnemyGroup.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/15.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyGroup.h"

@interface DoublePathEnemyGroup : EnemyGroup

-(id)init:(NSString*)target :(NSString*) target2;



@property (nonatomic,assign)NSString* line1;
@property (nonatomic,assign)NSString* line2;

@end
