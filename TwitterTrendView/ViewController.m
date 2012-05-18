//
//  ViewController.m
//  TwitterTrendView
//
//  Created by 真有 津坂 on 12/05/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize trendLabel;
@synthesize trendArray;
@synthesize trendname1,trendname2,trendname3,trendname4;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //取得するトレンドの数を最高4個にする
    trendArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    //トレンドのURLを呼び出す
    NSURL *twTurl = [NSURL URLWithString:@"https://api.twitter.com/1/trends/23424856.json"];
     //設定したアドレスにアクセスする設定をする
    NSURLRequest *twTrequest = [NSURLRequest requestWithURL:twTurl];
     //NSURLConnectionで実際にアクセスする
    [NSURLConnection sendAsynchronousRequest:twTrequest queue:[NSOperationQueue mainQueue]completionHandler:^(NSURLResponse *twTresponse, NSData *twTdata, NSError *twTerror) {
        if (twTerror) {
            NSLog(@"error: %@", [twTerror localizedDescription]);
            return;
        }
        
         //jsonで解析する。NSJSONSerializationはiOS5から使える
        NSArray *json = [NSJSONSerialization JSONObjectWithData:twTdata
                                                        options:kNilOptions 
                                                          error:&twTerror];
        //ここSearchAPIと異なるので注意!
        trendArray = [[json objectAtIndex:0] objectForKey:@"trends"];
        NSLog(@"%@",trendArray);
         //nameキーの上から4つを取り出す
       trendname1 = [[trendArray objectAtIndex:0] objectForKey:@"name"];         
         trendname2 = [[trendArray objectAtIndex:1] objectForKey:@"name"];
       trendname3 = [[trendArray objectAtIndex:2] objectForKey:@"name"];
        trendname4 = [[trendArray objectAtIndex:3] objectForKey:@"name"];
            }];
  
}
     

- (void)viewDidUnload
{
    [self setTrendLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//アクションシートを起動する
- (IBAction)trendAction:(id)sender {
    //タイトルやキャンセルボタンの設定、destructiveButtonTitleはシートのいちばん上のボタンに表示する文字列でotherButtonTitlesは2番目以降
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"トレンドリスト" delegate:self cancelButtonTitle:@"キャンセル" destructiveButtonTitle:trendname1 otherButtonTitles:trendname2,trendname3,trendname4, nil];
    //アクションシートを表示する
    [actionSheet showInView:self.view];
    
}

//アクションシートのボタンをタップしたときにする処理
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //タップしたボタンに書いてある文字列を表示
    trendLabel.text = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    
}
@end
