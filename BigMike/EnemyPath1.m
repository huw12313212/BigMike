//
//  EnemyPath1.m
//  BigMike
//
//  Created by Thomas on 13/10/6.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "EnemyPath1.h"

@implementation EnemyPath1

-(id)init{
    if (self = [super init]){
        isLimitedLife = true;
        maxLifeTime = 6;
        return self;
    }
    else{
        return nil;
    }
//    Po = ccp(<#CGFloat x#>, <#CGFloat y#>);
//    P1 = ccp(<#CGFloat x#>, <#CGFloat y#>);
//    P2 = ccp(<#CGFloat x#>, <#CGFloat y#>);
//    P3 = ccp(<#CGFloat x#>, <#CGFloat y#>);
}

-(CGPoint) GetPosition:(float)nowTime{
    return ccp(-100, 0);
}

@end
