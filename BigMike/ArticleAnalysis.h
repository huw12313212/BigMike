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
    
}

@property (strong,nonatomic)NSString* title;
@property (strong,nonatomic)NSString* content;
@property (strong,nonatomic)NSArray* sentenceArray;


-(id)init;
-(void)analysis;




@end
