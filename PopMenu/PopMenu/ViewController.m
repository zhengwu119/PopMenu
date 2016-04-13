//
//  ViewController.m
//  PopMenu
//
//  Created by kyo on 16/4/13.
//  Copyright © 2016年 RongZhong. All rights reserved.
//

#import "ViewController.h"
#import "MenuLabel.h"
#import "HyPopMenuView.h"
#import <POP.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 200, 30);
    [button setTitle:@"点击弹出框" forState:UIControlStateNormal];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(openMeu) forControlEvents:UIControlEventTouchUpInside];
}



//打开菜单
- (void)openMeu {
    NSArray *Objs = @[
                      [MenuLabel CreatelabelIconName:@"center_photo" Title:@"拍照"],
                      [MenuLabel CreatelabelIconName:@"center_vedio" Title:@"视频"],
                      [MenuLabel CreatelabelIconName:@"center_album" Title:@"相册"],
                      ];
    CGFloat x,y,w,h;
    x = CGRectGetWidth(self.view.bounds)/2 - 213/2;
    y = CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.3f;
    w = 213;
    h = 57;
    
    //自定义的头部视图
    UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    topView.image = [UIImage imageNamed:@"compose_slogan"];
    topView.contentMode = UIViewContentModeScaleAspectFit;
    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    
    //添加弹出菜单音效
    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    //添加取消菜单音效
    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    //添加选中按钮音效
    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    
    
    
    [HyPopMenuView CreatingPopMenuObjectItmes:Objs TopView:topView /*nil*/OpenOrCloseAudioDictionary:AudioDictionary /*nil*/ SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
        NSLog(@"Index-%ld",(long)index);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
