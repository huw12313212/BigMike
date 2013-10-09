//
//  MenuLayer.h
//  BigMike
//
//  Created by Ho Jimmy on 13/10/9.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "CCLayer.h"
#import "CCScene.h"
#import "CCLabelTTF.h"
@interface MenuLayer : CCLayer {
    CCLabelTTF *titleLabel;
    CCLabelTTF *startLabel;
    CCLabelTTF *creditLabel;
}
+(CCScene *) scene;
@end
