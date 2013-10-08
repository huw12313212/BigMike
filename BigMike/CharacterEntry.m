//
//  CharacterEntry.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/8.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "CharacterEntry.h"

@implementation CharacterEntry


-(id)init:(NSString*) SingleCharacter
{
    if(self = [super init])
    {
        self.character = SingleCharacter;
        count = 0;
        
        return self;
    }
    else
    {
        return nil;
    }
}

- (NSComparisonResult)compare:(CharacterEntry *)otherObject
{
    return [@(self->count*self.character.length) compare:@(otherObject->count*otherObject.character.length)];
}





@end
