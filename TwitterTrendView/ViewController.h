//
//  ViewController.h
//  TwitterTrendView
//
//  Created by 真有 津坂 on 12/05/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate> {
    
    //トレンドのリスト
    NSMutableArray *trendArray;
    //トレンドのリストの0番目・1番目・2番目・3番目のデータの文字列
    NSString *trendname1,*trendname2,*trendname3,*trendname4;
 
}



@property (weak, nonatomic) IBOutlet UILabel *trendLabel;
@property (nonatomic,retain) NSMutableArray *trendArray;

@property (nonatomic,retain) NSString *trendname1,*trendname2,*trendname3,*trendname4;

//アクションシートを起動
- (IBAction)trendAction:(id)sender;
@end
