//
//  ArticleAnalysis.h
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleAnalysis : NSObject
{
    int index;
}

@property (strong,nonatomic)NSString* title;
@property (strong,nonatomic)NSString* content;
@property (strong,nonatomic)NSArray* sentenceArray;
@property (strong,nonatomic)NSMutableDictionary* characterDictionary;
@property (strong,nonatomic)NSMutableArray* characterArray;



-(id)init;
-(void)analysis;
-(Boolean)isEnd;

-(NSString*) GetNextLine;


@end
