//
//  ArticleAnalysis.m
//  BigMike
//
//  Created by 王 瀚宇 on 13/10/4.
//  Copyright (c) 2013年 王 瀚宇. All rights reserved.
//

#import "ArticleAnalysis.h"
#import "cocos2d.h"
#import "CharacterEntry.h"

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
        
        
     //  self.content = @" APEC峰會落幕，這次代表馬總統參加的前副總統蕭萬長感觸良多，他說，APEC成員國對經濟自由開放的決心讓他感動，但是台灣卻只想參加國際經濟組織，不知道參加的目標和所需要付出的代價，這是民眾及政治人物都要思考的地方，蕭萬長也表示，因為國情特殊，目前中華台北領袖無法親自出席APEC領袖會議，一旦時機成熟、條件符合，或許馬英九總統明、後年有機會親自與會。  排排站大合照，蕭萬長站在泰國美女總理縈拉後方，大陸習近平以及俄羅斯總統譜丁第一排居中，APEC峰會誰是主角，大合照的位置透露出玄機。  蕭萬長20年後重返APEC擔任領袖代表，過去，他曾經4次以經濟部長還有領袖代表身分與會，這次再來，他感觸良多。  前副總統蕭萬長：「我們很可惜，因為我們對國際的活動，我們的關心度不夠，我們只關心什麼只關心參加，參加裡面的東西在作什麼，參加的內容是什麼，目標在哪裡，我們倒不是很關心。」  南韓、大陸還有印尼等與會國目標明確，就是積極拚經濟，反觀台灣卻始終在外交和政治泥淖中掙扎，企業領袖一對對進場，這是閉幕前一夜的領袖晚宴，蕭萬長夫婦雖不是受矚目的一對，但是找機會和各國領袖建立關係的動作頻頻，蕭萬長兩次輕拍菲律賓總統艾奎諾的肩膀與他攀談，蕭夫人也主動和美國國務卿凱瑞閒話家常。  而登上外媒頭版的夫人出遊照，蕭夫人當天是一襲2013夏姿春夏服飾，和習近平夫人彭麗媛由大陸設計師打造的大紅中國式上衣競豔，一路上她始終尾隨彭麗媛，找機會和她交流，有外交困境，行銷台灣發展經濟得靠自己創造，找出明確方向。";
    
    self.sentenceArray = [self.content componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"，。"]];
        
    self.characterDictionary = [[NSMutableDictionary alloc]init];
    
    [self analysis];
    
    
    CCLOG(@"sentence length %d",[self.sentenceArray count]);
        
        for(CharacterEntry* entry in self.characterArray)
        {
            CCLOG(@"%@,%d",entry.character,entry->count);
            
        }
        
        return self;
    }
    else
    {
        return nil;
    }
}


- (void)AnalysisWord:(int)wordSize
{
    for(int i =0;i<self.content.length -(wordSize-1);i++)
    {
        NSString* character = [self.content substringWithRange:NSMakeRange(i, wordSize)];
        
        CharacterEntry* entry;
        
        NSCharacterSet *cset = [NSCharacterSet characterSetWithCharactersInString:character];
        NSRange range = [@"？「」），：()" rangeOfCharacterFromSet:cset];
        if (range.location != NSNotFound)
        {
            continue;
        }
        
        entry = [self.characterDictionary objectForKey:character];
        if( entry == nil)
        {
            entry = [[CharacterEntry alloc]init:character];
            [self.characterDictionary setObject:entry forKey:character];
        }
        entry->count++;
    }
}

-(void)analysis
{
    //[self AnalysisWord:1];
    [self AnalysisWord:2];
    [self AnalysisWord:3];
    [self AnalysisWord:4];
    
    self.characterArray = [[[self.characterDictionary allValues]sortedArrayUsingSelector:@selector(compare:)]mutableCopy];
    
    
    NSMutableArray* trashArray = [[NSMutableArray alloc]init];
    
    for(int i = 0 ; i<self.characterArray.count;i++)
    {
        CharacterEntry* nowEntry = self.characterArray[i];
        
        
        for(int j = i+1;j<self.characterArray.count;j++)
        {
            CharacterEntry* greater = self.characterArray[j];
            if([greater.character rangeOfString:nowEntry.character].location != NSNotFound)
            {
                [trashArray addObject:nowEntry];
            }
        }
    }
    
    [self.characterArray removeObjectsInArray:trashArray];
    
    
    
}



@end
