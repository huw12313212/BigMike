//
//  BulletManager.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BulletManager : NSObject
{
}

-(id)init :(CCNode*) parent;
-(void)update:(ccTime) dt withPoint : (CGPoint)position;

@property (nonatomic,strong)NSMutableArray* BulletArray;

@end