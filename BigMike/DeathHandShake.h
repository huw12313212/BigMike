//
//  DeathHandShake.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/22.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "cocos2d.h"
#import "Constants.h"

@interface DeathHandShake :NSObject
{
    @public
    Boolean started;
    float initCounter;
    CGPoint difPosition;
    CGPoint difVector;
    
}

-(id)init :(CCNode*)game :(CCNode*)boss :(NSString*)labelString;
-(void) shootAt:(CGPoint)position andVectorWith:(CGPoint) vector;
-(void)update:(ccTime)dt;


@property (nonatomic,assign) CCNode* Game;
@property (nonatomic,assign) CCNode* Boss;
@property (nonatomic,strong) NSString* labelString;
@property (nonatomic,strong) NSMutableArray* handArray;




@end
