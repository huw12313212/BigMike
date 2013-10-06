//
//  ArticleAnalysis.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "ArticleAnalysis.h"
#import "cocos2d.h"

@implementation ArticleAnalysis
{
    
}

-(Boolean)isEnd
{
    return index == [self.sentenceArray count];
}

-(NSString*) GetNextLine
{
    NSString* nowData = self.sentenceArray[index];
    index ++;
    return nowData;
}

-(id)init
{
    if(self = [super init])
    {
    
    index = 0;
    
    self.title = @"政爭以來首會晤 江揆向王院長澄清誤會";
    self.content = @"行政院長江宜樺今(4)天下午主動透露，就在立法院長王金平宣布院會休息後，首次與王金平進行長達20分鐘的會晤溝通，並全程以「院長」稱呼王金平，除了對王協調議事表達感激外，並向王金平澄清外界指他越權的說法不符事實，希望王不要放在心上，並希望未來王能繼續協助行政院，行政院也會配合立法院依憲政權責所做的要求。對此，王金平不願多做表示。 江宜樺今天第5度無法上台施政報告，但在下午4時左右離開議場時，主動向媒體表示，利用院會休息時間，首次與王金平進行會晤溝通，向王金平表明對他協調議事的感激，以及澄清過去外傳自己對立院的批評言論等。江宜樺說，「這是開議以來一直都沒有機會能夠跟王院長坐下來好好談一談，今天剛好因為下午休會時間比較早，所以我就利用這段時間，也很感謝王院長騰出這個時間來，所以我們能夠好好把一些事情，可以溝通的比較清楚。我相信不管是我們行政團隊，或全體國人都樂於見到，就是我們的政局能夠往安定的方向，能夠讓國家往進步的方向來發展。」對江宜樺主動說出「江王會」，王金平並沒有否認，但顯然有些意外，不願多做表示，希望外界以江宜樺的發言為主，「請他發言，不要來找我。（記者：可是他說他來看你？）來看我，那你們問他就好，幹嘛要問我？」 據了解，今天的「江王會」主要是幾位立委於國民黨團大會中建議的，同時在政院秘書長陳威仁的推動下，2人才得以在今天私下會面，行政院發言人鄭麗文表示，陪同「江王會」的除了王金平、江宜樺之外，國民黨政策會執行長林鴻池和立法院副院長洪秀柱也陪同。至於與王金平見面是否會感到尷尬？江宜樺表示不會，他感謝王金平騰出時間，讓他們可以好好把一些事情溝通清楚，相信無論是行政團隊或全體國人都樂見政局安定。";
    
    self.sentenceArray = [self.content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"，。"]];
    
    
        CCLOG(@"sentence length %d",[self.sentenceArray count]);
        
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)analysis
{
    
}



@end
