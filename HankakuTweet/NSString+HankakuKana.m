//
//  NSString+HankakuKana.m
//  HankakuTweet
//
//  Created by koshikawa on 2014/07/14.
//  Copyright (c) 2014年 ppworks. All rights reserved.
//

#import "NSString+HankakuKana.h"

@implementation NSString (HankakuKana)
- (NSString *)convertToHankakukana
{
    NSMutableString *target =self.mutableCopy;
    
    for(int p = 0; p < [target length]; p++)
    {
        NSRange range = NSMakeRange(p, 1);
        NSString *moji = [target substringWithRange:range];
        
        @autoreleasepool
        {
            NSString* (^getHankakuKana)(NSString*) = ^(NSString* str) {
                //if([str isEqualToString:@"゛"]) return @"ﾞ";
                //if([str isEqualToString:@"゜"]) return @"ﾟ";
                if([str isEqualToString:@"ヲ"] || [str isEqualToString:@"を"]) return @"ｦ";
                if([str isEqualToString:@"ァ"] || [str isEqualToString:@"ぁ"]) return @"ｧ";
                if([str isEqualToString:@"ィ"] || [str isEqualToString:@"ぃ"]) return @"ｨ";
                if([str isEqualToString:@"ゥ"] || [str isEqualToString:@"ぅ"]) return @"ｩ";
                if([str isEqualToString:@"ェ"] || [str isEqualToString:@"ぇ"]) return @"ｪ";
                if([str isEqualToString:@"ォ"] || [str isEqualToString:@"ぉ"]) return @"ｫ";
                if([str isEqualToString:@"ャ"] || [str isEqualToString:@"ゃ"]) return @"ｬ";
                if([str isEqualToString:@"ュ"] || [str isEqualToString:@"ゅ"]) return @"ｭ";
                if([str isEqualToString:@"ョ"] || [str isEqualToString:@"ょ"]) return @"ｮ";
                if([str isEqualToString:@"ッ"] || [str isEqualToString:@"っ"]) return @"ｯ";
                if([str isEqualToString:@"ー"] || [str isEqualToString:@"〜"]) return @"ｰ";
                if([str isEqualToString:@"ア"] || [str isEqualToString:@"あ"]) return @"ｱ";
                if([str isEqualToString:@"イ"] || [str isEqualToString:@"い"]) return @"ｲ";
                if([str isEqualToString:@"ウ"] || [str isEqualToString:@"う"]) return @"ｳ";
                if([str isEqualToString:@"エ"] || [str isEqualToString:@"え"]) return @"ｴ";
                if([str isEqualToString:@"オ"] || [str isEqualToString:@"お"]) return @"ｵ";
                if([str isEqualToString:@"カ"] || [str isEqualToString:@"か"]) return @"ｶ";
                if([str isEqualToString:@"キ"] || [str isEqualToString:@"き"]) return @"ｷ";
                if([str isEqualToString:@"ク"] || [str isEqualToString:@"く"]) return @"ｸ";
                if([str isEqualToString:@"ケ"] || [str isEqualToString:@"け"]) return @"ｹ";
                if([str isEqualToString:@"コ"] || [str isEqualToString:@"こ"]) return @"ｺ";
                if([str isEqualToString:@"サ"] || [str isEqualToString:@"さ"]) return @"ｻ";
                if([str isEqualToString:@"シ"] || [str isEqualToString:@"し"]) return @"ｼ";
                if([str isEqualToString:@"ス"] || [str isEqualToString:@"す"]) return @"ｽ";
                if([str isEqualToString:@"セ"] || [str isEqualToString:@"せ"]) return @"ｾ";
                if([str isEqualToString:@"ソ"] || [str isEqualToString:@"そ"]) return @"ｿ";
                if([str isEqualToString:@"タ"] || [str isEqualToString:@"た"]) return @"ﾀ";
                if([str isEqualToString:@"チ"] || [str isEqualToString:@"ち"]) return @"ﾁ";
                if([str isEqualToString:@"ツ"] || [str isEqualToString:@"つ"]) return @"ﾂ";
                if([str isEqualToString:@"テ"] || [str isEqualToString:@"て"]) return @"ﾃ";
                if([str isEqualToString:@"ト"] || [str isEqualToString:@"と"]) return @"ﾄ";
                if([str isEqualToString:@"ナ"] || [str isEqualToString:@"な"]) return @"ﾅ";
                if([str isEqualToString:@"ニ"] || [str isEqualToString:@"に"]) return @"ﾆ";
                if([str isEqualToString:@"ヌ"] || [str isEqualToString:@"ぬ"]) return @"ﾇ";
                if([str isEqualToString:@"ネ"] || [str isEqualToString:@"ね"]) return @"ﾈ";
                if([str isEqualToString:@"ノ"] || [str isEqualToString:@"の"]) return @"ﾉ";
                if([str isEqualToString:@"ハ"] || [str isEqualToString:@"は"]) return @"ﾊ";
                if([str isEqualToString:@"ヒ"] || [str isEqualToString:@"ひ"]) return @"ﾋ";
                if([str isEqualToString:@"フ"] || [str isEqualToString:@"ふ"]) return @"ﾌ";
                if([str isEqualToString:@"ヘ"] || [str isEqualToString:@"へ"]) return @"ﾍ";
                if([str isEqualToString:@"ホ"] || [str isEqualToString:@"ほ"]) return @"ﾎ";
                if([str isEqualToString:@"マ"] || [str isEqualToString:@"ま"]) return @"ﾏ";
                if([str isEqualToString:@"ミ"] || [str isEqualToString:@"み"]) return @"ﾐ";
                if([str isEqualToString:@"ム"] || [str isEqualToString:@"む"]) return @"ﾑ";
                if([str isEqualToString:@"メ"] || [str isEqualToString:@"め"]) return @"ﾒ";
                if([str isEqualToString:@"モ"] || [str isEqualToString:@"も"]) return @"ﾓ";
                if([str isEqualToString:@"ヤ"] || [str isEqualToString:@"や"]) return @"ﾔ";
                if([str isEqualToString:@"ユ"] || [str isEqualToString:@"ゆ"]) return @"ﾕ";
                if([str isEqualToString:@"ヨ"] || [str isEqualToString:@"よ"]) return @"ﾖ";
                if([str isEqualToString:@"ラ"] || [str isEqualToString:@"ら"]) return @"ﾗ";
                if([str isEqualToString:@"リ"] || [str isEqualToString:@"り"]) return @"ﾘ";
                if([str isEqualToString:@"ル"] || [str isEqualToString:@"る"]) return @"ﾙ";
                if([str isEqualToString:@"レ"] || [str isEqualToString:@"れ"]) return @"ﾚ";
                if([str isEqualToString:@"ロ"] || [str isEqualToString:@"ろ"]) return @"ﾛ";
                if([str isEqualToString:@"ワ"] || [str isEqualToString:@"わ"]) return @"ﾜ";
                if([str isEqualToString:@"ン"] || [str isEqualToString:@"ん"]) return @"ﾝ";
                if([str isEqualToString:@"ガ"] || [str isEqualToString:@"が"]) return @"ｶﾞ";
                if([str isEqualToString:@"ギ"] || [str isEqualToString:@"ぎ"]) return @"ｷﾞ";
                if([str isEqualToString:@"グ"] || [str isEqualToString:@"ぐ"]) return @"ｸﾞ";
                if([str isEqualToString:@"ゲ"] || [str isEqualToString:@"げ"]) return @"ｹﾞ";
                if([str isEqualToString:@"ゴ"] || [str isEqualToString:@"ご"]) return @"ｺﾞ";
                if([str isEqualToString:@"ザ"] || [str isEqualToString:@"ざ"]) return @"ｻﾞ";
                if([str isEqualToString:@"ジ"] || [str isEqualToString:@"じ"]) return @"ｼﾞ";
                if([str isEqualToString:@"ズ"] || [str isEqualToString:@"ず"]) return @"ｽﾞ";
                if([str isEqualToString:@"ゼ"] || [str isEqualToString:@"ぜ"]) return @"ｾﾞ";
                if([str isEqualToString:@"ゾ"] || [str isEqualToString:@"ぞ"]) return @"ｿﾞ";
                if([str isEqualToString:@"ダ"] || [str isEqualToString:@"だ"]) return @"ﾀﾞ";
                if([str isEqualToString:@"ヂ"] || [str isEqualToString:@"ぢ"]) return @"ﾁﾞ";
                if([str isEqualToString:@"ヅ"] || [str isEqualToString:@"づ"]) return @"ﾂﾞ";
                if([str isEqualToString:@"デ"] || [str isEqualToString:@"で"]) return @"ﾃﾞ";
                if([str isEqualToString:@"ド"] || [str isEqualToString:@"ど"]) return @"ﾄﾞ";
                if([str isEqualToString:@"バ"] || [str isEqualToString:@"ば"]) return @"ﾊﾞ";
                if([str isEqualToString:@"ビ"] || [str isEqualToString:@"び"]) return @"ﾋﾞ";
                if([str isEqualToString:@"ブ"] || [str isEqualToString:@"ぶ"]) return @"ﾌﾞ";
                if([str isEqualToString:@"ベ"] || [str isEqualToString:@"べ"]) return @"ﾍﾞ";
                if([str isEqualToString:@"ボ"] || [str isEqualToString:@"ぼ"]) return @"ﾎﾞ";
                if([str isEqualToString:@"パ"] || [str isEqualToString:@"ぱ"]) return @"ﾊﾟ";
                if([str isEqualToString:@"ピ"] || [str isEqualToString:@"ぴ"]) return @"ﾋﾟ";
                if([str isEqualToString:@"プ"] || [str isEqualToString:@"ぷ"]) return @"ﾌﾟ";
                if([str isEqualToString:@"ペ"] || [str isEqualToString:@"ぺ"]) return @"ﾍﾟ";
                if([str isEqualToString:@"ポ"] || [str isEqualToString:@"ぽ"]) return @"ﾎﾟ";
                return str;
            };
            [target replaceCharactersInRange:NSMakeRange(p, 1) withString:getHankakuKana(moji)];
        }
    }
    
    return target;
}
@end
